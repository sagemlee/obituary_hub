class Search::ResultsController < ApplicationController

  def index
    if params[:name].empty? && params[:location].empty? && params[:age].empty? && params[:year].empty?
      flash[:notice] = "Please fill out a field below"
      redirect_to "/search/advanced"
    end
    results = ObituarySearch.new.advanced_query_local(params)
    @obituaries = Obituary.find(results)
    @obituaries_api = ObituarySearch.new.advanced_query(params) || []
  end
end
