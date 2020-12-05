class V1::WeatherController < ApplicationController
  def search
    response = JSON.parse(request_api(params['city']))
    if response['cod'] == 200
      weather_response = response['weather'].first
      temp_response = response['main']
      render json: { 'main' => weather_response['main'],
                     'describtion' => weather_response['description'],
                     'min_temp' => temp_response['temp_min'],
                     'max_temp' => temp_response['temp_max'] }
    else
      render json: response
    end
  end
end
