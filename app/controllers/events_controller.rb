class EventsController < ApplicationController
  include EventsHelper
  include ApplicationHelper

  def index
    @prev_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
    @attendees_list = Event.attendees_members(params[:id])
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

  def attend_to_event
    @event = Event.find(params[:event][:id])
    @attendance = @event.attendees.push( current_user )
    redirect_to @event
  end
end
