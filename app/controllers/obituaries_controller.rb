class ObituariesController < ApplicationController
  def new
    @obituary = Obituary.new
  end
end
