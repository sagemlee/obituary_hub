class Obituaries::AdvancedController < ApplicationController

  def index

    @obituaries_api = ObituarySearch.new.search_advanced_obituaries(params[:name], params[:year])

  end

end
