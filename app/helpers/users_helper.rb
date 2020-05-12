module UsersHelper
    def user_params
        params.require(:user).permit(:username)
    end

    def previous_created?
        @previous_created.count > 0 ? 'Previous: ' : 'No previous events'
    end
    
    def upcoming_created?
        @upcoming_created.count > 0 ? 'Upcoming: ' : 'No upcomming events'
    end

    def previous?
        @previous.count > 0 ? 'Previous: ' : 'No previous events'
    end
    
    def upcoming?
        @upcoming.count > 0 ? 'Upcoming: ' : 'No upcomming events'
    end

   
    def logged_user?(position)
        case position
        when 'title'
            if !current_user.nil? && current_user.id == @user.id
                "Welcome #{current_user.username}" 
            else
                "Profile of #{@user.username}"
            end
        when 'list'
            !current_user.nil? && @user.id == current_user.id ? 'you' : @user.username
        end
    end
end