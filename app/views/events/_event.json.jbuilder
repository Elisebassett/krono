date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

#required full Calendar keys
json.id event.id
json.title event.title
json.description event.description
json.start event.start.in_time_zone(Time.zone.name).strftime(date_format)
json.start_time event.start_time
json.end event.end.in_time_zone(Time.zone.name).strftime(date_format)
json.end_time event.end_time

#additional keys
json.color event.color unless event.color.blank?
json.allDay event.all_day_event? ? true : false

#helper keys
json.update_url event_path(event, method: :patch)
json.edit_url edit_event_path(event)	