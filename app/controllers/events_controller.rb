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
    @event.date = DateTime.new(@event.date.year,
                                 @event.date.month,
                                 @event.date.day,
                                 params[:date_time].to_s.split(':')[0].to_i,
                                 params[:date_time].to_s.split(':')[1].to_i,0)
    if @event.save
      redirect_to current_user
    else
      render :new
    end
  end

  def attend_to_event
    if current_user.nil?
      flash[:error] = 'You need to sign in or sign up to register to this event'
      visited_event_set(params[:event][:id])
      redirect_to users_sign_in_path
    else
      @event = Event.find(params[:event][:id])
      @event.add_new_attendee(current_user)
      if @event.errors.any?
        flash[:error] = @event.errors.details[:register_already][0][:error][:message] 
      end
      redirect_to @event
    end
  end
end
