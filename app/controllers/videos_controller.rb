class VideosController < ApplicationController
  def index

  end

  # def create
  #   @video = Video.new(video_params)
  #   if @video.save
  #     render :tubing
  #   else
  #     #need to add message to user
  #     render :tubing
  #   end
  # end

  def tubing
    @video = Video.new
    @note = Note.new
    if session[:vid_url]
      @video.get_data(session[:vid_url])
      @video.transcript = @video.parse_transcript.map do |text|
        split_time = text[0].split(":")
        if split_time.length == 2
          [(split_time[0].to_i*60+split_time[1].to_i), text[1]]
        elsif split_time == 3
          [(split_time[0].to_i*360+split_time[1].to_i*60+split_time[2].to_i), text[1]]
        end
      end
      @end_url = session[:vid_url].split("v=")[1].split("&")[0]
    else
      redirect_to videos_path
    end

  end

  def create
    @video = Video.create(link: params[:link])
    if @video
      session[:vid_id] = @video.id
      session[:vid_url] = params[:link]
    end
    redirect_to tubing_path
  end

  private

  def video_params
      params.require(:video).permit(:link, :name)
  end
end
