class PizzaLocationsController < ApplicationController
  before_filter :admin_only?, :only => [:new, :create, :edit, :update]
  
  def show 
    @pizza_location = PizzaLocation.friendly.find(params[:id])
  end
  
  def nearby
    @pizza_locations = PizzaLocation.near(params[:search], 10)
  end  
  
  
  def new
    @pizza_location = PizzaLocation.new
  end
  
  def create
    @pizza_location = PizzaLocation.new(pizza_location_params)
    if @pizza_location.save
      redirect_to @pizza_location
    else
      render "new"
    end    
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
  
  def nearyou 
    if params[:latitude].nil? or params[:longitude].nil?
      location = request.location  
      byebug
    else
      @pizza_locations = PizzaLocation.near([params[:latitude],params[:longitude]], 10)
    end        
    render :json => @pizza_locations
  end
  
  private

  def pizza_location_params
    params.require(:pizza_location).permit(:name, :address, :city, :zipcode, :country, :photos_attributes => [:id, :primary, :image, :_destroy])
  end
  
  def admin_only?
    unless( user_signed_in? and current_user.admin ) 
      redirect_to "/", :notice => "Access Denied"
    end    
  end
    
end
