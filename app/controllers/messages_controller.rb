class MessagesController < ApplicationController
  before_action :set_application
  before_action :set_chat

  def create
    @chat.with_lock do
      @msg = @chat.messages.new(msg_params)
      next_msg_number = msgs_count + 1
      @msg.msg_number = next_msg_number
      @msg.save!
      @chat.messages_count = next_msg_number
      @chat.save!
    end
    if @msg.errors.full_messages.empty?
      render_json_success(@msg)
    else
      render_json_validation_errors(@msg)
    end
  end

  def update
    @msg = @chat.messages.find_by(msg_number: params[:id])
    @msg.update_attributes(msg_params)
    if @msg.save
      render_json_success(@msg)
    else
      render_json_validation_errors(@msg)
    end
  end

  def show
    @msg = @chat.messages.find_by(msg_number: params[:id])
    render_json_success(@msg._source)
  end

  def index
    render_json_success(@chat.messages)
  end

  def search
    term = search_params
    @messages = Message.search_in_chat(term, @chat.id)
    render_json_success(@messages)
  end

  def set_application
    @application = Application.find_by(token: params[:application_id])
    if !@application
      render_not_found_error "Application"
    end
  end

  def set_chat
    @chat = @application.chats.find_by(number: params[:chat_id])
    if !@chat
      render_not_found_error "Chat"
    end
  end

  def msgs_count
    @count = @chat.messages.count
  end

  def msg_params
    params.require(:message).permit(:content)
  end

  def search_params
    params.require(:term)
  end
end
