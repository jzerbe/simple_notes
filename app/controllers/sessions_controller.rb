class SessionsController < ApplicationController
  INVALID_LOGIN = 'Invalid username/password combination'

  def new
  end

  def create
    user = User.find_by(
      username: params[:session][:username],
      password_digest: User.digest_from_password(params[:session][:password])
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
  end
end
