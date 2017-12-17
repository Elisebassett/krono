date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

#required full Calendar keys
json.id event.id
json.title event.title
json.start event.start.strftime(date_format)
json.end event.end.strftime(date_format)

#additional keys
json.color event.color unless event.color.blank?
json.allDay event.all_day_event? ? true : false

#helper keys
json.update_url event_path(event, method: :patch)
json.edit_url edit_event_path(event)	