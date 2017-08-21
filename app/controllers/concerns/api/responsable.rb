module Api::Responsable
  def json_response(object, status = :ok, serializer: nil)
    render json: object, status: status, serializer: serializer
  end

  def json_error(model, status = :bad_request)
    json_response({ errors: model.errors.full_messages }, status)
  end
end
