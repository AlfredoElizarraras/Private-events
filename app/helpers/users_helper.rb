module UsersHelper
    def user_params
        params.require(:user).permit(:username)
    end

    def user_created_events
        html_to_render = '<ul>'
        current_user.events.each do |event|
            p html_to_render += "<li> #{event.date.strftime("Event day on: %m-%d-%Y at: %H:%M")} </li>"
        end
        html_to_render += '</ul>'
        html_to_render.html_safe
    end
end
