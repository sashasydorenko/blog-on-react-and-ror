module Api::ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ errors: [e.message] }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ errors: [e.message] }, :not_found)
    end

    rescue_from RuntimeError do |e|
      json_response({ errors: [e.message] }, :bad_request)
    end
  end
end
