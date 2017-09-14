class GroupsController < ApplicationController

  def static
    @notes = Video.find(session[:vid_id]).notes
    render :layout => false
  end


end
