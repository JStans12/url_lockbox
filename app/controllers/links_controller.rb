class LinksController < ApplicationController

  def index
    redirect_to login_path unless current_user
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id].to_i)
    if link.update(link_params)
      flash[:success] = "link updated"
      redirect_to root_path
    else
      error = link.errors.messages.first[1][0]
      flash[:error] = "link update failed" + error_key[error]
      redirect_to root_path
    end
  end

  def create
    link = Link.new(link_params)
    if link.save
      current_user.links << link
      flash[:success] = "new link created"
      redirect_to root_path
    else
      error = link.errors.messages.first[1][0]
      flash[:error] = "link creation failed" + error_key[error]
      redirect_to root_path
    end
  end

  private

    def link_params
      params.permit(:title, :url)
    end

    def error_key
      {"is invalid" => " url is invalid",
       "can't be blank" => " fields can't be blank"}
    end
end
