class MessagesController < ApplicationController
  before_action :set_application
  before_action :set_chat

  def create
  	@msg = @chat.messages.new(msg_params)
  	@msg.msg_number = msgs_count + 1
  	if @msg.save
  		render_json_success(@msg)
  	else 
  		render_json_errors(@msg)
  	end
  end

  def update
  end

  def show
  	@msg = @chat.messages.find_by(msg_number: params[:id])
  	render_json_success(@msg)
  end

  def index
  	render_json_success(@chat.messages)
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
end
