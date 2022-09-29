module Response
  def user_json_response(object, status = :ok)
    render json: UsersSerializer.new(object), status: status
  end

  def error_response(message, status)
    render json: message, status: status
  end 
end
