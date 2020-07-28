class ObituariesController < ApplicationController

  def new
    render_404 if !current_user
    @obituary = Obituary.new
  end

  def create
    @obituary = current_user.obituaries.new(obituary_params)
    if @obituary.save
      flash[:success] = 'New obituary was successfully created.'
      redirect_to obituary_path(@obituary.id)
    else
      flash[:error] = @obituary.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @obituary = Obituary.find(params[:id])
  end

  def edit
    @obituary = Obituary.find(params[:id])
    render_404 if !current_user || !current_user.has_obituary?(@obituary)
  end

  def update
    @obituary = Obituary.find(params[:id])
    if @obituary.update(obituary_params)
      flash[:success] = 'Obituary was successfully updated.'
      redirect_to obituary_path(@obituary.id)
    else
      flash[:error] = @obituary.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    Obituary.find(params[:id]).destroy
    flash[:notice] = 'Obituary was successfully deleted.'
    redirect_to '/profile'
  end

  private

  def obituary_params
    params.require(:obituary).permit(:first_name, :last_name, :description, :age, :city, :state, :image_url, :covid)
  end
end
