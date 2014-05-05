class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end

  def show
    @charity = Charity.find(params[:id])
  end

  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)
    if @charity.save
      redirect_to @charity, notice: "Charity successfully added."
    else
      render :new
    end
  end

  def edit
    @charity = Charity.find(params[:id])
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update_attributes(charity_params)
      redirect_to @charity, notice: "Charity successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
    redirect_to charities_path, notice: "Charity successfully deleted."
  end

  private
  def charity_params
    params.require(:charity).permit(:name, :link, :mission, :zipcode)
  end
end
