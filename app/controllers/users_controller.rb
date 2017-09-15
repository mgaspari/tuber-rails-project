class UsersController < ApplicationController

  def index
    @user = User.new
    @note = Note.new
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user =  User.find_by(id: params[:id]) || User.find_by(id: session[:id])
    if @user.groups.size > 0
      @groups = @user.groups
    else
      redirect_to videos_path
    end
  end

  def search
    @user = User.find_by(username: user_params_search[:search])
    if @user
      redirect_to @user
    else
      redirect_to videos_path
    end
  end


  private
  def user_params
      params.require(:user).permit(:id, :first_name, :last_name, :username, :password)
  end
  def user_params_search
    params.require(:user).permit(:search)
  end
end
