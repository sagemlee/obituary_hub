class Search::CommunityController < ApplicationController
  def index
    @obituaries = Obituary.search_by_name(params[:name])
  end
end
