class ChatsController < ApplicationController
  before_action :set_application

  def create
    @application.with_lock do
      next_chat_number = chats_count + 1
      @chat = @application.chats.create(number: next_chat_number)
      @chat.save!
      @application.chats_count = next_chat_number
      @application.save!
    end
    @chat = @application.chats.create(number: chats_count + 1)
    if @chat
      render_json_success(@chat)
    else
      render_json_errors(@chat)
    end
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
    if !@application
      render_not_found_error "Application"
    end
  end

  def chats_count
    @count = @application.chats.count
  end
end
