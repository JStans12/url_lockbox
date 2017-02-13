class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "logged in as #{user.email}"
        redirect_to root_path
      else
        flash[:error] = "unsuccessful login attempt"
        redirect_to root_path
      end
    else
      flash[:error] = "unsuccessful login attempt"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
