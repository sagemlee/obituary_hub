class Search::ResultsController < ApplicationController

  def index
    @obituaries_api = ObituarySearch.new.search_advanced_obituaries(params[:year])
  end

end
