class HomeController < ApplicationController
  def index
     
  end

  def results
    @category = params[:category]
  end
end
