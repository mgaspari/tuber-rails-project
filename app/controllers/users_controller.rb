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

  end

  private
  def user_params
      params.require(:user).permit(:id, :first_name, :last_name, :username, :password)
  end
end
