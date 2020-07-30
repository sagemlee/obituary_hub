class Search::ResultsController < ApplicationController

  def index
    results = ObituarySearch.new.advanced_query_local(params)
    @obituaries = Obituary.find(results)
    @obituaries_api = ObituarySearch.new.advanced_query(params) || []
  end
end
