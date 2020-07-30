class Obituaries::RecentController < ApplicationController
  def index
    @obituaries = Obituary.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @obituaries_api = ObituarySearch.new.recent_obituaries
  end
end
