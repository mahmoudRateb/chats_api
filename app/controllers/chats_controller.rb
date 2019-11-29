class ChatsController < ApplicationController
  before_action :set_application

  def create
  	@chat = @application.chats.create(number: chats_count + 1)
  	if @chat
  		render_json_success(@chat)
  	else 
  		render_json_errors(@chat)
  	end
  end

  def update
  end

  def show
  	@chat = @application.chats.find_by(number: params[:id])
  	render_json_success(@chat)
  end

  def index
  	render_json_success(@application.chats)
  end

  def set_application
  	@application = Application.find_by(token: params[:application_id])
  end

  def chats_count
  	@count = @application.chats.count
  end
end

