class ApplicationController < ActionController::API

	  # Function that that is used in the case of response
  # It takes in the resource and prepares a proper json
  # response for returning
  def render_json_success(resource)
    render json: {
      status: "success",
      data: resource
    }, status: 200
  end

  # The function that handles the validation errors
  # It takes in the resource, and iterates through the
  # validation errors, and creates the proper json error body
  def render_json_validation_errors(resource)
    errors = []
    resource.errors.each do |fieldName, value|
      single_body = {
        :message => value,
        :fieldName => fieldName
      }
      errors.push(single_body)
    end
    render json: {
      status: "error",
      error: {
        status: "error",
        name: "Unprocessable Entity",
        data: errors
      }
    }, status: 422
  end
end
