module SessionsHelper
    ANONYMOUS = 'Anonymous'
    # TODO probably a much better place for this \/
    LOGIN_BUTTON_CLASSES = 'ui-btn ui-corner-all ui-btn-inline'\
        ' ui-mini footer-button-left ui-btn-icon-left ui-icon-user'

    def current_user  # nil if invalid id instead of exception
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def logged_in?
        current_user != nil
    end
end
