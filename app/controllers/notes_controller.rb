class NotesController < ApplicationController

  def new
    raise params.inspect
    @time = params[:time]
  end

  def create
    byebug
    Note.create(title: params[:title], content: params[:content], video_id: session[:vid_id])
    render 'blank'
  end

end
