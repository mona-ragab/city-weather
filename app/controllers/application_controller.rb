class ApplicationController < ActionController::Base
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
