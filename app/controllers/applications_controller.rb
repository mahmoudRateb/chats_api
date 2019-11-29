class ApplicationsController < ApplicationController
  def create
  end

  def update
  end

  def show
  	render_json_success("Hello world")
  end
end
