class PizzaLocationsController < ApplicationController
  
  def show 
    @pizza_location = PizzaLocation.friendly.find(params[:id])
  end
    
end
