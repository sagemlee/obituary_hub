class Search::ResultsController < ApplicationController

  def index
    @obituaries_api = ObituarySearch.new.advanced_query(params)
    @obituaries = ObituarySearch.new.advanced_query_local(params)
  end

end
