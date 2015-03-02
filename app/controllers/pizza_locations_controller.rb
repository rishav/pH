class PizzaLocationsController < ApplicationController
  
  def show 
    @pizza_location = PizzaLocation.friendly.find(params[:id])
  end
  
  def edit
    @pizza_location = PizzaLocation.friendly.find(params[:id])
  end
  
  def update
    @pizza_location = PizzaLocation.friendly.find(params[:id])
    if @pizza_location.update_attributes(pizza_location_params)
      redirect_to @pizza_location
    else
      render "edit"
    end        
  end
  
  private

  def pizza_location_params
    params.require(:pizza_location).permit(:name, :address, :city, :zipcode, :country, :photos_attributes => [:id, :primary, :image, :_destroy])
  end
    
end
