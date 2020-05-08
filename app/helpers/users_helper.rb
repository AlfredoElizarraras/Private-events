module UsersHelper
    def user_params
        params.require(:user).permit(:username)
    end

    def user_created_events
        html_to_render = ''
        current_user.events.each do |event|
            html_to_render += '<article class="event-card">'
            html_to_render += "<a href=\"\\events\\#{event.id}\"> #{event.description} </a>"
            html_to_render += "<p> #{event.date.strftime("Event day on: %m-%d-%Y at: %H:%M")} </p>"
            html_to_render += '</article>'
        end
        html_to_render.html_safe
    end
end
