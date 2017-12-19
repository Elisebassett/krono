$(document).on('turbolinks:load', function(){
	
	$('#create_goal').on('click', function() {
		$.getScript('/goals/new', function() {});//getScript function
	});//create goal on click


});