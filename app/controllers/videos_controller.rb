class VideosController < ApplicationController
  def index

  end

  def tubing
    @video = Video.new
    if params[:link]
      @video.get_data(params[:link])
      @video.transcript = @video.parse_transcript
      @end_url = params[:link].split("v=")[1]
    else
      redirect_to videos_path
    end
  end

  def show


  end

  private

  def video_params
      params.require(:video).permit(:link, :name)
  end
end
