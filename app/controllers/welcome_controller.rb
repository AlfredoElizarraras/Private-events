class WelcomeController < ApplicationController
  def show
    @upcoming = Event.upcoming_events
  end
end
