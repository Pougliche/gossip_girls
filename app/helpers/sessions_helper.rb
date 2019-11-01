module SessionsHelper

    def current_user

        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end
    
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def logged_in?
        session[:user_id].nil?
    end

end
