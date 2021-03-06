module SessionsHelper
    def logged_in?
        !!current_user
    end 
        # helpers / methods used in other actions
    def current_user
        if session[:current_user_id]
        @current_user ||= User.find(session[:current_user_id])
        end 
    end 

    def login(user)
        session[:current_user_id] = @user.id
    end 

    def is_current_user?(user)
        user == current_user
    end 
end 