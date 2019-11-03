class ApplicationController < ActionController::Base
  def homepage
    @videos = Video.includes(:user).latest.page(params[:page])
  end
end
