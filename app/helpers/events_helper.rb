module EventsHelper
    def event_params
        params.require(:event).permit(:date, :description)
    end

    def prev_events
        html_to_render = ''
        @prev_events.each do |event|
            html_to_render += '<article class="event-card">'
            html_to_render += "<a href=\"\\events\\#{event.id}\"> #{event.description} </a>"
            html_to_render += "<p> #{event.date.strftime("Event day on: %m-%d-%Y at: %H:%M")} </p>"
            html_to_render += '</article>'
        end
        html_to_render.html_safe
    end

    def upcoming_events
        html_to_render = ''
        @upcoming_events.each do |event|
            html_to_render += '<article class="event-card">'
            html_to_render += "<a href=\"\\events\\#{event.id}\"> #{event.description} </a>"
            html_to_render += "<p> #{event.date.strftime("Event day on: %m-%d-%Y at: %H:%M")} </p>"
            html_to_render += '</article>'
        end
        html_to_render.html_safe
    end

    def attendees_list
        html_to_render = ''
        @attendees_list.each do |member|
            html_to_render += '<article class="">'
            html_to_render += "<a href=\"\\users\\#{member.id}\"> #{member.username} </a>"
            html_to_render += '</article>'
        end
        html_to_render.html_safe
    end
end
