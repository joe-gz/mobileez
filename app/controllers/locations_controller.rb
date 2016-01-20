class LocationsController < ApplicationController

  def index
    if params[:search]
      @response = Yelp.client.search([:search])
    else
      @response = Yelp.client.search('Washington DC')
    end
  end

end
