class VideosController < ApplicationController
  before_action :authenticate_user!, except: :show

  def new
    @video = Video.new
  end

  def show
    @video = Video.find params[:id]
  end

  def create
    video_service = VideoService.new video_params[:url], current_user
    @video = video_service.call
    if @video.persisted?
      flash[:notice] = "Video shared successfully!!!"
      redirect_to @video
    else
      flash[:danger] = "Video share failed. Please try again!!!"
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit :url
  end
end
