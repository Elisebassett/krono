var initialize_calendar;
initialize_calendar = function() {
	$('.calendar').each(function() {
		var calendar = $(this);
		calendar.fullCalendar({
			header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      events: '/events.json',
      select: function(start, end) {
        $.getScript('/events/new', function(){
	      	$('.start_date').val(moment(start).toISOString());
	      	$('.start_time').val('00:00:00');
	      	$('.end_date').val(moment(end).toISOString());
	      	$('.end_time').val('00:00:00');
        });//getscript function
        calendar.fullCalendar('unselect');
      },//select option

      eventDrop: function(event) {
      	console.log(event);
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            start_time: event.start_time,
            end: event.end.format(),
            end_time: event.end_time
          }
        };
        console.log(event_data);
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });//ajax call for event update
      },//eventDrop option

      eventClick: function(event) {
        $.getScript(event.edit_url, function() {});
      }

		});//fullCalendar function
	})//calendar.each function
};//initialize calendar function

$(document).on('turbolinks:load', initialize_calendar);