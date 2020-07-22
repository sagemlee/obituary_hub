class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
    flash[:notice] = "You are now logged in as #{user.first_name}"
    redirect_to "/profile"
  end
end
