var INNOVATION = {}; 
var cluiRef;
steal.map({
    "clui": "/static/clui"
});

steal('jquery','clui/app')
               .then('nb/ui/util/jquery-query');
(function($) {

    INNOVATION.askHomeworkHelper = {
        init: init
    };

    INNOVATION.result = {};

    function init() {
        bindClearEvents();
        $('#submitSearch').click(searchAndGetResults);
        $('#query').on('keypress', function(event){
            if (event.keyCode == '13') { 
                event.preventDefault(); 
                searchAndGetResults();
            } 

        });
    }

    function bindClearEvents() {
        $('#query').focus(clearPreviousResults);
        $('#contentSets').focus(clearPreviousResults);
        $('#displayGroups').focus(clearPreviousResults);

        function clearPreviousResults() {
            $('#error').empty();
            $('#searchResultsHeader').empty();
            $('#searchResultsList').empty();
            return false;
        }
    }

    function searchAndGetResults() {
        $('.listView').empty();
        var userSearchQuery = $('#query').val();
        var userContentSets = $('#contentSets').val();
        var userDisplayGroups = $('#displayGroups').val();
        var resultSize = 20;
        var url = "/HeySmartGuy/search?query=";
         

        if (userSearchQuery === '') {
            $('#error').html('<div class="row"><div class="span5">&nbsp;</div><div class="span7"><h3>Paul Tunney will kill me if I let you submit that search.<br/>Please search on another topic.</h3></div></div>');
        } else {
			$.ajax({
				url: url + userSearchQuery + '&contentSets='+userContentSets+'&displayGroups=' + userDisplayGroups + '&resultSize=' + resultSize,
				success: function(data) {
					var results = data[0].results;
					var row = "";
					for(var i = 0; i < results.length; i++) {
						//console.log(results[i].docTitle);
                        var docNum = results[i].resultItem.itemIdentifier;
                        var docTitle = results[i].docTitle;
                        var docUrl = "/HeySmartGuy/retrieve?docId=" + docNum;
                        row = "<li><a href='"+docUrl+"'>"+ docTitle +"</li>";
                        $('.listView').append(row);
					}

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