class SessionsController < ApplicationController

  def new
  end

  def create

  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
