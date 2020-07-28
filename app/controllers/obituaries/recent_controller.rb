class Obituaries::RecentController < ApplicationController
  def index
    @obituaries = Obituary.all.order(:created_at)
    @obituaries_api = ObituarySearch.new.recent_obituaries
  end
end
