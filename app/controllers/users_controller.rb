class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      error = user.errors.messages.first[1][0]
      flash[:error] = error_key[error]
      redirect_to login_path
    end
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end

    def error_key
      {"has already been taken" => "email has already been taken",
       "doesn't match Password" => "passwords don't match"}
    end
end
