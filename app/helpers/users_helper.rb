module UsersHelper
    def user_params
        params.require(:user).permit(:username)
    end

    def user_created_events
        html_to_render = '<div class="events-created">'
        html_to_render += '<h3>'
        html_to_render += 'MY CREATED EVENTS'
        html_to_render += '</h3>'
        current_user.events.each do |event|
            html_to_render += '<article class="event-card">'
            html_to_render += "<p> #{event.description} </p>"
            html_to_render += "<p> #{event.date.strftime("Event day on: %m-%d-%Y at: %H:%M")} </p>"
            html_to_render += '</article>'
        end
        html_to_render += '</div>'
        html_to_render.html_safe
    end
end
