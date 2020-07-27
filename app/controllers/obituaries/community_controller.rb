class Obituaries::CommunityController < ApplicationController
  def index
    @obituaries = Obituary.all
  end
end