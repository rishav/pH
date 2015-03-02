class SiteController < ApplicationController
  
  def index
    @featured_locations = PizzaLocation.featured
  end
end
