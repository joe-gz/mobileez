class Yelp < ActiveRecord::Base

  def initialize
    require 'yelp'
    Yelp.client.configure do |config|
      config.consumer_key = ENV['YOUR_CONSUMER_KEY']
      config.consumer_secret = ENV['YOUR_CONSUMER_SECRET']
      config.token = ENV['YOUR_TOKEN']
      config.token_secret = ENV['YOUR_TOKEN_SECRET']
    end

    # url = "https://api.yelp.com/v2/search?term=food&location=San+Francisco"
    #
    # response = HTTParty.get(url)

    # instantiating abv, style, and photo_url by parsing through the JSON response
  end
  # Yelp.client.search('San Francisco', { term: 'food' })


  # # search
  # response = Yelp.client.search('San Francisco')
  #
  # response.businesses
  # # [<Business 1>, <Business 2>, ...]
  #
  # response.businesses[0].name
  # # "Kim Makoi, DC"
  #
  # response.businesses[0].rating
  # 5.0
end
