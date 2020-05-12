module SessionHelper

    def current_user
        user = User.find(session[:user])
    rescue
        nil
    end

    def current_user_set(id)
        session[:user] = id
    end

    def user_sign_out
        session[:user] = nil
    end

    def visited_event
        event = Event.find(cookies[:event])
    rescue
        nil
    end
    
    def visited_event_set(event_id)
        cookies[:event] = event_id
    end
    
    def visited_event_clear
        cookies[:event] = nil
    end
end