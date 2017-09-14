class GroupsController < ApplicationController
  def index
    redirect_to users_path
  end
  def new

  end
  def create

  end
  def show
    @group = Group.find_by(id: params[:id])
    @notes = @group.notes
  end

end
