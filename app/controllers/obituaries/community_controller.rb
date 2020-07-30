class Obituaries::CommunityController < ApplicationController
  def index
    @obituaries = Obituary.all.paginate(page: params[:page], per_page: 10)
  end
end
