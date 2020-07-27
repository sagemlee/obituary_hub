class GoogleController < ApplicationController
  def create
    user = User.create_with_omniauth(request.env['omniauth.auth'])
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "You are now logged in as #{user.first_name}"
      redirect_to "/profile"
    else
      flash[:error] = "An Error has occured with Google"
      redirect_to '/users/new'
    end
  end
end
