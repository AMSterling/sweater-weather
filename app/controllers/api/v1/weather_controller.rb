class Api::V1::WeatherController < ApplicationController

  def forecast
    data = WeatherFacade.weather_forecast(params[:location])
    json_response(data)
  end

  private
    def json_response(object, status = :ok)
      render json: ForecastSerializer.new(object), status: status
    end
end
