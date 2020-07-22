class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "You are now logged in as #{@user.first_name}"
      redirect_to "/profile"
    else
      flash[:notice] = "Your username or password is incorrect"
      render :new
    end
  end
end
