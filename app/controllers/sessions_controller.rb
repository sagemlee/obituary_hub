class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You are now logged in as #{user.first_name}"
      redirect_to "/profile"
    else
      flash[:notice] = "The credentials you have entered are invalid"
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You are now logged out"
    redirect_to "/"
  end
end
