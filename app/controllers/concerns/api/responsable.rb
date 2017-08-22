module Api::Responsable
  def json_response(object, status = :ok, serializer: nil)
    render json: object, status: status, serializer: serializer
  end

  def json_error(model, status = :bad_request, serializer: nil)
    json_response({ errors: model.errors.full_messages }, status, serializer: serializer)
  end

  def json_action(model, serializer: nil)
    if model.errors.any?
      json_error model, serializer: serializer
    else
      json_response model, serializer: serializer
    end
  end
end
