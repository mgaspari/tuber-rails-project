class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      redirect_to @user
    else
      redirect_to "/users"
    end
  end

  def destroy
      session.delete :id
      redirect_to videos_path
  end
end
