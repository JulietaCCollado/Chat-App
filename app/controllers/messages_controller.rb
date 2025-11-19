class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room

  def create
    @message = @chat_room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      # Use Turbo Streams to broadcast or redirect
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @chat_room, notice: "Message sent." }
      end
    else
      redirect_to @chat_room, alert: "Message could not be sent."
    end
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
