class Obituaries::RecentController < ApplicationController
  def index
    @obituaries = Obituary.all.order(:created_at)
  end
end
