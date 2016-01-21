class LocationsController < ApplicationController

  def index
    if params[:name]
      @yelp = Yelp.client.search(params[:name])
    end

  end

  def create

  end

  private


end
