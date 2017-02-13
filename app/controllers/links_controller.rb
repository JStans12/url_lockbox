class LinksController < ApplicationController

  def index
    redirect_to login_path unless current_user
  end

  def create
    link = Link.new(link_params)
    if link.save
      flash[:success] = "new link created"
      redirect_to root_path
    else
      flash[:error] = "link creation failed"
      redirect_to root_path
    end
  end

  private

    def link_params
      params.permit(:title, :url)
    end
end
