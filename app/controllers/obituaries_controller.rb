class ObituariesController < ApplicationController
  def index
  end

  def new
    @obituary = Obituary.new
  end

  def create
    @obituary = current_user.obituaries.new(obituary_params)
    if @obituary.save
      flash[:success] = 'Obituary Created'
      redirect_to obituary_path(@obituary.id)
    else
      flash[:error] = @obituary.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @obituary = Obituary.find(params[:id])
  end

  private

  def obituary_params
    params.require(:obituary).permit(:first_name, :last_name, :description, :age, :city, :state, :image_url)
  end
end
