class VideosController < ApplicationController
  def index

  end

  def tubing
    @video = Video.new
    if params[:link]
      @video.get_data(params[:link])
      @video.transcript = @video.parse_transcript.map do |text|
        split_time = text[0].split(":")
        if split_time.length == 2
          [(split_time[0].to_i*60+split_time[1].to_i), text[1]]
        elsif split_time == 3
          [(split_time[0].to_i*360+split_time[1].to_i*60+split_time[2].to_i), text[1]]
        end
      end
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
