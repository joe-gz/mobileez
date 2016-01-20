class LocationsController < ApplicationController

  def index
    @response = Yelp.client.search('San Francisco')
  end

end
