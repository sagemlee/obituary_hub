class UsersController < ApplicationController

  def new
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      flash[:success] = "Hello #{new_user.first_name} #{new_user.last_name}, thank you for creating an account!"
      session[:user_id] = new_user.id
      redirect_to "/profile"
    else
      flash[:notice] = new_user.errors.full_messages.join(". ").to_s
      redirect_to "/users/new"
    end
  end


  def show

  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
