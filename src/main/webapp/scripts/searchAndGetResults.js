/**
**********************************************************
 Copyright (c) Cengage Learning 2011 - All rights reserved
********************************************************** 
*/
// fix paths for UI project transition
var INNOVATION = {}; 
(function(){    
    steal.map({
        "clui": "/static/clui"
    });
})()

steal('jquery','clui/app')
      .then('thirdparty/query')
      .then( function() {
         Clui.app(function(){
            cluiRef = Clui;
            if($.query.get('data')) {
                var data = $.query.get('data'); 
                var m = data.context.selectedText;
                getSelectedText(m);       
            } 
         });
      }); 

function getSelectedText(str) { 
        var phrase = str;
        $('#query').val(phrase);
        $('#submitSearch').trigger('click');   
     }

(function($) {

    INNOVATION.askHomeworkHelper = {
        init: init
    };

    INNOVATION.result = {};

    function init() {
       // bindClearEvents();
        bindBackEvent();
        clearElements();
        $('#submitSearch').click(searchAndGetResults);
        $('#query').on('keypress', function(event){
            if (event.keyCode == '13') { 
                event.preventDefault(); 
                searchAndGetResults();
            } 
        });
    }

    function bindBackEvent() {
        $(".back a").on("click", function(event){
            event.preventDefault();
            history.go(-1);
        });
    }

    function clearElements() {
        var url = $.url();
        var inline = url.param('inline');
        
        if(inline == "true") {
            $('header').hide();
            $('.back').hide();
            $('body').css({
                'background-position':'top left'
            });
        }
    }

    function bindClearEvents() {
        // $('#query').focus(clearPreviousResults);
        // $('#contentSets').focus(clearPreviousResults);
        // $('#displayGroups').focus(clearPreviousResults);

        // function clearPreviousResults() {
        //     $('#error').empty();
        //     $('#searchResultsHeader').empty();
        //     $('#searchResultsList').empty();
        //     return false;
        // }

    }

    function setSelectedText()
    {   
        if($.query.get('data'))
        {
            var data = $.query.get('data');             
            var m = data.context.selectedText;           
            $('#query').val(m);
            return data.context.selectedText;
        }
    }
    

    function searchAndGetResults() {
        $('section').hide();
        $('.listView').empty();
        var userSearchQuery = $('#query').val();
        var userContentSets = $('#contentSets').val();
        var userDisplayGroups = $('#displayGroups').val();
        var resultSize = 20;
        var url = "/UHIC/search?query=";
         

        if (userSearchQuery === '') {
            $('#error').html('<div class="row"><div class="span5">&nbsp;</div><div class="span7"><h3>Paul Tunney will kill me if I let you submit that search.<br/>Please search on another topic.</h3></div></div>');
        } else {
            $('.loader').show();
			$.ajax({
				url: url + userSearchQuery + '&contentSets='+userContentSets+'&displayGroups=' + userDisplayGroups + '&resultSize=' + resultSize,
				success: function(data) {
					var results = data[0].results;
					var row = "";
					for(var i = 0; i < results.length; i++) {
						//console.log(results[i].docTitle);
                        var docNum = results[i].resultItem.itemIdentifier;
                        var docTitle = results[i].docTitle;
                        var pubTitle = results[i].publicationMetadata.pubTitle;
                        var pubYear = results[i].publicationMetadata.pubCopyrightYear;
                        var snippet = results[i].additionaldata.Snippet;
                        var docUrl = "/UHIC/retrieve?docId=" + docNum;
                        row = "<li>";
                        if($('div.addActivity').length > 0) {
                            row = row + "<input type='radio' name='douments' value='"+docNum+"' />";
                        }
                        row = row + "<a href='"+docUrl+"'>"+ docTitle +"</a>";
                        row = row + "<span class='pubTitle'>"+pubTitle+"</span>";
                        if(pubYear.length > 0) {
                            row = row + "<span class='pubYear'>, "+pubYear+"</span>";
                        }
                        if(snippet.length > 0) {
                           row = row + "<span class='snippet'>..."+snippet+"...</span>"; 
                        }    

                        row = row + "</li>";
                        
                        $('.listView').append(row);
					}

                    $('.loader').hide();
                    $('section').show();
                    
				}
			})

        }
        return false;
    }

})(jQuery);

$(document).ready(function() {
    INNOVATION.askHomeworkHelper.init();
});