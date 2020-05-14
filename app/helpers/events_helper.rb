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
end
