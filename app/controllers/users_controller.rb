class UsersController < ApplicationController

  def new
  end

  def create
    new_user = User.create(user_params)
    flash[:success] = "Hello #{new_user.first_name} #{new_user.last_name}, thank you for creating an account!"
    redirect_to "/profile"
  end

  def show

  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
