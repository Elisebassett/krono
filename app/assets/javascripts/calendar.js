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
        	$('.datepicker').pickadate({
				    selectMonths: true, // Creates a dropdown to control month
				    selectYears: 15, // Creates a dropdown of 15 years to control year,
				    today: 'Today',
				    clear: 'Clear',
				    close: 'Ok',
				    closeOnSelect: false // Close upon selecting a date,
				  });

	        console.log(start);
	      	$('.start_time').val(moment(start).toISOString());
	      	$('.end_time').val(moment(end).toISOString());
				  
        });
        calendar.fullCalendar('unselect');
      }
		});
	})
};

$(document).on('turbolinks:load', initialize_calendar);