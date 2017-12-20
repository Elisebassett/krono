$(document).on('turbolinks:load', function(){
	
	$('#create_goal').on('click', function() {
		$.getScript('/goals/new', function() {});//getScript function
	});//create goal on click

	$('.edit_goal_trigger').on('click', function() {
		var goal_id = $(this).closest('.goal_card').attr('id');
		$.getScript(`/goals/${goal_id}/edit`, function(){
			// window.remote_container = $('#remote_container');
		});

		// var goal_id = $(this).closest('.goal_card').attr('id');
		// $.ajax({
		// 	url: '/goals/goal_edit_partial',
		// 	data: goal_id,
		// 	type: 'PATCH'
		// });//ajax call
	});//edit goal modal trigger

});