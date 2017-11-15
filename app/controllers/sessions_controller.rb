class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user][:name] && params[:user][:password]
      @user = User.authenticate(params[:user][:name], params[:user][:password])
    end

    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
  
end