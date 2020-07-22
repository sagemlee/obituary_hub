class ObituariesController < ApplicationController
  def index
  end

  def new
    @obituary = Obituary.new
  end

  def create
    @obituary = current_user.obituaries.new(obituary_params)
  end

  private

  def obituary_params
    params.require(:obituary).permit(:first_name, :last_name, :description, :age, :city, :state, :image_url)
  end
end
