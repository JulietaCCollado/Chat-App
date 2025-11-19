class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room, only: [:show, :join, :leave]

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @messages = @chat_room.messages.includes(:user).order(created_at: :asc)
    @message = Message.new
    @is_member = @chat_room.users.include?(current_user)
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save
      flash[:notice] = "Chat room created successfully."
      redirect_to @chat_room
    else
      flash.now[:alert] = "Failed to create chat room."
      render :new, status: :unprocessable_entity
    end
  end

  def join
  @chat_room = ChatRoom.find(params[:id])
  @chat_room.users << current_user unless @chat_room.users.include?(current_user)
  redirect_to @chat_room, notice: "You joined the chat room."
end

def leave
  @chat_room = ChatRoom.find(params[:id])
  @chat_room.users.delete(current_user)
  redirect_to root_path, notice: "You left the chat room."
end


  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end
end
