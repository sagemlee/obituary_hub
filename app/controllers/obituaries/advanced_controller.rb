class Obituaries::AdvancedController < ApplicationController

  def index
    if params[:name] == ""
      flash[:notice] = "Please fill out name for NYT Search"
      redirect_to "/search/advanced"
    else
    @obituaries_api = ObituarySearch.new.search_advanced_obituaries(params[:name], params[:year])
    end
  end

end
