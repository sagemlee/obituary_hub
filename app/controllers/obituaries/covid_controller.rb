class Obituaries::CovidController < ApplicationController
  def index
    @obituaries = Obituary.where(covid: true) 
  end
end
