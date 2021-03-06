class Goal < ApplicationRecord
  belongs_to :user



  def add_to_tomorrow(current_user)

  	time_allocation = self[:time_allocation]

  	start_params = nil
  	end_params = nil

    tomorrow = Time.zone.tomorrow
    tomorrow_events = current_user.events.where('DATE(start) = ?', tomorrow).sort_by &:start

    p tomorrow_events
    # return false if self.start = tomorrow

    rise = current_user[:rise].change(year: tomorrow.year, month: tomorrow.month, day: tomorrow.day)
    bed_time = current_user[:sleep].change(year: tomorrow.year, month: tomorrow.month, day: tomorrow.day)

    tomorrow_events.length.times do |i|
      
      if i == 0 #if it's the first event of the day
#time_allocation is saved in db as minutes. The comparison eqution results in seconds, thus the division by 60
				p 'MORNING'
				p time_allocation + 20 < (tomorrow_events[i][:start].to_time - rise)/60

        if time_allocation + 20 < (tomorrow_events[i][:start].to_time - rise)/60

        p 'WHEN DO YOU WAKE UP?'
				p rise

				p 'WHEN IS YOUR FIRST APPOINTMENT?'
				p tomorrow_events[i][:start].to_time
          

          p 'SET MORNING GOAL'
	        p rise

	        start_params = rise + 10.minutes
          p 'START PARAMS'
	        p start_params
          end_params = start_params + (time_allocation*60) + 10.minutes
          p 'END PARAMS'
	        p end_params
          event_params = {title: self.name, description: self.description, start: start_params, end: end_params, color: self.color}
			    event = current_user.events.new(event_params)
			    event.save
          
          break

        end #set goal before first appointment

      elsif i == (tomorrow_events.length - 1)

        p 'LAST EVENT'
        p time_allocation + 20 < (tomorrow_events[i][:start].to_time - tomorrow_events[i-1][:end].to_time)/60

        p 'EVENING'
        p time_allocation + 20 < (bed_time - tomorrow_events[i][:end].to_time)/60

        if time_allocation + 20 < (bed_time - tomorrow_events[i][:end].to_time)/60

        	p 'WHEN DOES THE LAST APPOINTMENT END?'
          p tomorrow_events[i][:end]

          p 'WHEN DO YOU bed_time?'
          p bed_time
          
          p 'SET EVENING GOAL'

          start_params = tomorrow_events[i][:end] + 10.minutes
          p 'START PARAMS'
	        p start_params
          end_params = start_params + (time_allocation + 10).minutes
          p 'END PARAMS'
	        p end_params

	        event_params = {title: self.name, description: self.description, start: start_params, end: end_params, color: self.color}
				  event = current_user.events.new(event_params)
				  event.save

          break

        end#set evening goal

      elsif i > 0 #if it's not the first or last event

      	p 'DAY EVENT'
      	p time_allocation + 20 < (tomorrow_events[i][:start].to_time - tomorrow_events[i-1][:end].to_time)/60

        if time_allocation + 20 < (tomorrow_events[i][:start].to_time - tomorrow_events[i-1][:end].to_time)/60

        	p 'WHEN DOES THE LAST APPOINTMENT END?'
          p tomorrow_events[i-1][:end]

          p 'WHEN DOES THE NEXT APPOINTMENT START?'
          p tomorrow_events[i][:start]


        	start_params = tomorrow_events[i-1][:end] + 10.minutes
        	p 'START PARAMS'
	        p start_params
          end_params = start_params + (time_allocation + 10).minutes
          p 'END PARAMS'
	        p end_params
          
          p 'SET A GOAL BETWEEN APPOINTMENTS!'

          event_params = {title: self.name, description: self.description, start: start_params, end: end_params, color: self.color}
				  event = current_user.events.new(event_params)
				  event.save

          break
        end #set the goal between appointments    
      end #end of elseif
    end #times loop
    
  	
  end #add_to_tomorrow



end #Goal class
