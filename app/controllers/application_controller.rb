class ApplicationController < ActionController::Base
    def register_to_event(event)
      event.add_new_attendee(current_user)
    end
end
