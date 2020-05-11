module UsersHelper
    def user_params
        params.require(:user).permit(:username)
    end

    def user_created_events
        html_to_render = ''
        if current_user.events.count > 0
            html_to_render += "<h3>Events you have created: </h3>"
            html_to_render += '<ul>'
            current_user.events.each do |event|
                html_to_render += "<li> #{event.description} </li>"
            end
            html_to_render += '</ul>'
        else
            html_to_render += "<h3>You have not created events yet </h3>"
        end 
        html_to_render.html_safe
    end

    def events_attended
        html_to_render = ''
        if current_user.attended_events.count > 0
            html_to_render += "<h3>Events you will attend: </h3>"
            html_to_render += '<ul>'
            current_user.attended_events.each do |event|
                html_to_render += "<li> #{event.description} #{event.date}</li>"
            end
            html_to_render += '</ul>'
        else
            html_to_render += "<h3>You are not attending events yet </h3>"
        end 
        html_to_render.html_safe
    end
end
