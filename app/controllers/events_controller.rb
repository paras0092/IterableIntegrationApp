class EventsController < ApplicationController
    def create_event_a
      user_id = '123' # Replace with the actual user ID
      event_name = 'EventA'
      data = { custom_property: 'some_value' }
  
      IterableApiWrapper.create_event(user_id, event_name, data)
  
      flash[:notice] = 'Event A created successfully'
      redirect_to root_path
    end
  
    def create_event_b

      user_id = '123' # Replace with the actual user ID
      event_name = 'EventB'
      data = { custom_property: 'some_value' }
  
      IterableApiWrapper.create_event(user_id, event_name, data)
      template_id = 'YOUR_EMAIL_TEMPLATE_ID' # Replace with the actual template ID
    
      IterableApiWrapper.send_email(user_id, template_id)
  
      flash[:notice] = 'Email sent successfully for Event B'
      redirect_to root_path
    end
  end