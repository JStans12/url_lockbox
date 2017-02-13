class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
