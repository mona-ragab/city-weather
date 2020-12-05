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

  private

  def request_api(city_name)
    app_key = ENV.fetch('API_KEY')
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{URI.encode(city_name)}&appid=#{app_key}"
    begin
      response = RestClient.get(url)
      response
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
