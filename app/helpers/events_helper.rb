module EventsHelper
  def event_params
    params.require(:event).permit(:date, :description, :title, :location, :accessibility)
  end

  def attendees?
    @event.attendees.count.positive? ? 'Attendees: ' : 'This event have not attendees yet'
  end

  def upcoming_events?
    @upcoming.count.positive? ? 'Upcoming Events:' : 'No upcoming events yet'
  end

  def previous_events?
    @previous.count.positive? ? 'Previous Events:' : 'No previous events'
  end

  def public_event?
    @event.accessibility ? 'Private' : 'Public'
  end

  def can_see_event?
    return true unless @event.accessibility

    !current_user.nil? && (current_user.id == @event.creator_id || @event.user_in_invited_list?(current_user.id))
  end
end
