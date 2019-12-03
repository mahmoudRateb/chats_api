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
    @application = Application.find_by(token: params[:id])
    @application.update_attributes(app_params)
    if @application.save
      render_json_success(@application)
    else
      render_json_validation_errors(@application)
    end
  end

  def show
    @application = Application.find_by(token: params[:id])
    if @application
      render_json_success @application
    else
      render_not_found_error "Application"
    end
  end

  def app_params
    params.require(:application).permit(:name)
  end
end
