class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
      end
    else
    end
  end
end
