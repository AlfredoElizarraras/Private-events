module EventsHelper
    def event_params
        params.require(:event).permit(:date, :description, :title, :location, :accessibility )
    end

    def have_attendees?
       @event.attendees.count > 0 ? 'Attendees: ' : 'This event have not attendees yet'
    end

    def upcoming_events?
        @upcoming.count > 0 ? 'Upcoming Events:' : 'No upcoming events yet'
    end

    def previous_events?
        @previous.count > 0 ? 'Previous Events:' : 'No previous events'
    end

    def public_event?
        @event.accessibility ? 'Private' : 'Public'
    end

    def can_see_event?
      if current_user.nil?
        return false

      else
        if current_user.id == @event.creator_id ||
            @event.user_in_invited_list?(current_user.id)
            return true
        end
      end
    end
end
