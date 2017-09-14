class NotesController < ApplicationController

  def new
    @time = params[:time]
  end

  def create
    @group = Group.find_or_create_by(name: params[:name], user_id: session[:id])
    GroupsVideo.create(group_id: @group.id, video_id: session[:vid_id])
    Note.create(title: params[:title], content: params[:content], video_id: session[:vid_id])
    render '/groups/static'
  end

end
