class Api::V1::LinksController < ApplicationController

  def read
    link = Link.find(params[:id])
    link.read = true
    link.save
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:read)
  end
end
