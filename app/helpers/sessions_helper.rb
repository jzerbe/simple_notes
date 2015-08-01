module SessionsHelper
    ANONYMOUS = 'Anonymous'
    
    def current_user  # nil if invalid id instead of exception
      User.find_by(id: session[:user_id])
    end
    
    def current_username
        current_user ? current_user.username : SessionsHelper::AN
    end
    
    def log_in(user)
        session[:user_id] = user.id
    end
end
