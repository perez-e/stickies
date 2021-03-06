class StickiesController < ApplicationController
  before_filter :authenticate_user!

  def index
    stickies = current_user.stickies.order(:updated_at)

    render json: stickies.to_json
  end

  def show
    id = params[:id]
    sticky = current_user.stickies.find(id)

    render json: sticky.to_json
  end

  def create
    create_params = params[:sticky].permit(:body, :title, :top, :left_ratio, :archive)
    sticky = current_user.stickies.create(create_params)

    render json: sticky.to_json
  end

  def update 
    id = params[:id]
    sticky = current_user.stickies.find(id)
    update_params = params[:sticky].permit(:title, :body, :top, :left_ratio, :archive)
    sticky.update(update_params)

    render json: sticky.to_json
  end

  def destroy 
    sticky = current_user.stickies.find(params[:id])
    sticky.destroy

    render json: sticky.to_json
  end
  
end
