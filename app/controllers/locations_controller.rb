class LocationsController < ApplicationController

  def index
    @response = Location.new
  end

  def create
    # if params[:name]
    @yelp = Yelp.client.search(params[:location][:name])
    @response = Location.create(name:@yelp.businesses[0].name)
    # else
    #   @yelp = Yelp.client.search('Washington DC')
    #   @response = Location.create(name:@yelp.businesses[0].name)
    # end
    redirect_to "/"
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end


end
