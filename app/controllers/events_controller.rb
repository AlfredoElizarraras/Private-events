class EventsController < ApplicationController
  include EventsHelper
  include ApplicationHelper

  def index
    @events = Event.all
    @upcoming = Event.upcoming_events
    @previous = Event.previous_events
  end

  def show
    @event = Event.find(params[:id])
    @attendees_members = @event.attendees_members
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to current_user
    else
      render :new
    end
  end
end
