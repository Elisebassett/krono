$(document).on('turbolinks:load', function(){
	
	$('#create_goal').on('click', function() {
		$.getScript('/goals/new', function() {});//getScript function
	});//create goal on click

	$('.edit_goal_trigger').on('click', function() {
		var goal_id = $(this).closest('.goal_card').attr('id');
		$.getScript(`/goals/${goal_id}/edit`, function(){
			// window.remote_container = $('#remote_container');
		});
	});//edit goal modal trigger

});