class ApplicationsController < ApplicationController
  def create
    @application = Application.new(app_params)
    @application.create_token
    if @application.save
      render_json_success @application
    else
      render_json_validation_errors @application
    end
  end

  def update
  end

  def show
    @application = Application.find_by(token: params[:id])
    if @application
      render_json_success @application
    else
      render json: {
        status: "error",
        error: {
          status: "error",
          name: "Application not found",
        }
      }, status: 400
    end
  end

  def app_params
    params.require(:application).permit(:name)
  end
end
