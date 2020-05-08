module EventsHelper
    def event_params
        params.require(:event).permit(:date, :description)
    end

    def events_list
        html_to_render = ''
        @events.each do |event|
            html_to_render += '<article class="event-card">'
            html_to_render += "<a href=\"\\events\\#{event.id}\"> #{event.description} </a>"
            html_to_render += "<p> #{event.date.strftime("Event day on: %m-%d-%Y at: %H:%M")} </p>"
            html_to_render += '</article>'
        end
        html_to_render.html_safe
    end
end
