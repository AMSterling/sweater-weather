module Response
  def forecast_json_response(object, status = ok)
    render json: ForecastSerializer.new(object), status: status
  end

  def error_response(message, status)
    render json: message, status: status
  end
end
