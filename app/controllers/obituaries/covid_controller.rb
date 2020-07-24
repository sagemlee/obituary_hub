class Obituaries::CovidController < ApplicationController
  def index
    @obituaries = Obituary.all 
  end
end
