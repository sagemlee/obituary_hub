class Search::NytimesController < ApplicationController
  def index
    @obituaries_api = ObituarySearch.new.search_obituaries_by_name(params[:name])
  end
end
