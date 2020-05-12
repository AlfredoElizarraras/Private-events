module EventsHelper
    def event_params
        params.require(:event).permit(:date, :description )
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

end
