module UsersHelper
    def current_user
        User.find(session[:user])
    end

    def current_user_set(id)
        session[:user] = id
    end

    def user_params
        params.require(:user).permit(:username)
    end
end
