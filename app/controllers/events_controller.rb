class EventsController < ApplicationController
  include EventsHelper
  include ApplicationHelper

  def index
    @prev_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
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
    @error = nil
    @event = Event.find(params[:event][:id])
    @attendance = @event.attendances.build( { attendee_id: current_user.id })
    p '---------------here------------------'
    if @attendance.save
      p '...................saved.......................'
      redirect_to @event
    else
      @error = "Could not save the event."
      render :show
    end
  end
end
