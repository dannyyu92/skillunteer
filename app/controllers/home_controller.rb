class HomeController < ApplicationController
  include CharityHelper

  def index
     
  end

  def results
    @category = params[:category].downcase
    @top_charities = charities_grabber()
  end
end
