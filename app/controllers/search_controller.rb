class SearchController < ApplicationController
  def index
    @name = params[:name]
    @obituaries = Obituary.search_by_name(params[:name])
    @obituaries_api = ObituarySearch.new.search_obituaries_by_name(params[:name])
  end
end
