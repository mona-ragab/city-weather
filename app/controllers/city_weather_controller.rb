class CityWeatherController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def search
    response = JSON.parse(request_api(params['city']))
    if response['cod'] == 200
      @weather_response = response['weather'].first
      @temp_response = response['main']
      @city = params['city']
    else
      flash[:alert] = 'City not found.'
      redirect_to '/'
    end
  end
end
