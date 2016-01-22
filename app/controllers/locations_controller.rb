class LocationsController < ApplicationController

  def index
    if params[:name]
      @yelp = Yelp.client.search(params[:name], { term: 'food' })
    end

  end

  def show
    @review = Review.new
    @reviews = Review.all.where(location_id: params[:id])
    if params[:id]
      @yelp = Yelp.client.business(params[:id])
    end
  end

  def create

  end

  private


end
