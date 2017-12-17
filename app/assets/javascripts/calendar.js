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
      	console.log('problem after this');
        $.getScript('/events/new', function(){
	      	$('.start_time').val(moment(start).toISOString());
	      	$('.end_time').val(moment(end).toISOString());
        });//getscript function
        calendar.fullCalendar('unselect');
      },//select option

      eventDrop: function(event) {
      	console.log(event);
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
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