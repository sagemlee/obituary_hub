class SessionsController < ApplicationController

  def new
  end

  def create
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      user.save!
      flash[:notice] = "You are now logged in as #{user.first_name}"
      redirect_to "/profile"
    else
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
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You are now logged out"
    redirect_to "/"
  end
end
