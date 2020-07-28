class Search::CommunityController < ApplicationController
  def index
    @obituaries = Obituary.search_by_name(params[:name])
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
end
