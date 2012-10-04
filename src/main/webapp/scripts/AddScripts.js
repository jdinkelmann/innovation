var ADD = {};
(function($) {
	ADD.addReading = {
        init: init
    };

    function init() {
    	submitDocuments();
    }

    function submitDocuments() {
    	var form = $('#addActivity');
    	form.on('submit', function(e) {
    		e.preventDefault();
    		var parent = $(':checked').parent();
    		var pubYear = $('.pubYear',parent).text().split(' ');
    		var snippet = $('.snippet',parent).text().split('...');
    		var data = {
    			docNumber: $(':checked').val(),
    			title: $('a',parent).text(),
    			publication: $('.pubTitle',parent).text(),
    			publicationYear: pubYear[1],
    			snippet: snippet[1]
    		};
    		addActivity(data);
    	});
    }

    function addActivity(data) {
    	//console.log(data);
    	Clui.hub.pub('activity.resource.created', {
        	name: data.title,
        	description: data.snippet,
        	activityType: 1,
        	appActivityName: "Gale.USHistoryInContext/activities/Reading",
        	viewURI: "/UHIC/retrieve?inline=true&docId=" + data.docNumber
        });
    }
})(jQuery);


$(document).ready(function() {
    ADD.addReading.init();
});