class Search::ResultsController < ApplicationController

  def index
    @obituaries_api = ObituarySearch.new.advanced_query(params)
    results = ObituarySearch.new.advanced_query_local(params)
    @obituaries = Obituary.find(results)
  end

end
