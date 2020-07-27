class Obituaries::CovidController < ApplicationController
  def index
    @obituaries_api = CovidObituarySearch.new.search_covid_obituaries
    @obituaries = Obituary.where(covid: true)
    
  end
end
