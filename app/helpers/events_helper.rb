module EventsHelper
    def event_params
        params.require(:event).permit(:date, :description )
    end

    def events_list
        html_to_render = '<ul>'
        @events.each do |event|
            html_to_render += "<li> <a href= '/events/#{event.id}'>#{event.description}</a></li>"
        end
        html_to_render += '</ul>'
        html_to_render.html_safe
    end

    def event_users_list
        html_to_render = '<ul>'
        @event.attendees.each do |user|
            html_to_render += "<li> #{user.username} </li>"
        end
        html_to_render += '</ul>'
        html_to_render.html_safe
    end

end
