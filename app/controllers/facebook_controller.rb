class FacebookController < ApplicationController
  def create
    user = User.create_with_omniauth(request.env['omniauth.auth'])
    user.save!
    session[:user_id] = user.id
    flash[:notice] = "You are now logged in as #{user.first_name}"
    redirect_to "/profile"
  end
end
