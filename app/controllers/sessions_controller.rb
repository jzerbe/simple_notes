class SessionsController < ApplicationController
  INVALID_LOGIN = 'Invalid username/password combination'

  def new
  end

  def create
    username = params[:session][:username]
    password = params[:session][:password]

    user = User.find_by(
      username: username,
      password_digest: User.digest_from_password(password)
    )
    if user
      log_in user
      redirect_to user
    else
      flash.now[:danger] = SessionsController::INVALID_LOGIN
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
