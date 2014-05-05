class HomeController < ApplicationController
  #include CharityHelper

  def index
     
  end

  def results
    @category = params[:category].downcase
    @zipcode = params[:zip].to_i
    charities_by_zip = Charity.where(zipcode: (@zipcode-100)..(@zipcode+100))
    @top_charities = charities_by_zip.where("mission LIKE ?", "%#{params[:category]}%").first(3)
  end
end
