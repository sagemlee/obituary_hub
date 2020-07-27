class SearchController < ApplicationController
  def index
    binding.pry
      @obituaries_api = ObituarySearch.new.search_obituaries_by_name(parmas[:name])
  end
end
