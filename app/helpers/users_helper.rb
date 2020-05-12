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
end