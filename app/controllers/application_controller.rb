# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def register_to_event(event)
    event.add_new_attendee(current_user)
  end

  def decline_registration(event)
    event.change_status_to_declined(current_user)
  end
end
