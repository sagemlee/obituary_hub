class ObituariesController < ApplicationController
  def index
  end
  def new
    @obituary = Obituary.new
  end
end
