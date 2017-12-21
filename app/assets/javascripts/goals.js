$(document).on('turbolinks:load', function(){

//Set Timezone
	function set_time_zone_offset() {
    var current_time = new Date();
    Cookies.set('time_zone', current_time.getTimezoneOffset());
	}
	
	set_time_zone_offset();

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