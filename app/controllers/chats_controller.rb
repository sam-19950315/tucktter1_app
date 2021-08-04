class ChatsController < ApplicationController
  def index
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @chat = Chat.new
    @chats = @chat_room.chats.includes(:user)
    @user_id = current_user.id
    @user_ids = @chat_room.user_ids
    @user1 = User.find(@user_ids[0])
    @user2 = User.find(@user_ids[1])
  end

  def create
    @user_id = current_user.id
    @chat_room = ChatRoom.find(params[:chat_room_id])
    Chat.create(chat_params)
    redirect_to user_chat_room_chats_path(@user_id,@chat_room.id)    
  end

  private
  def chat_params
    params.permit(:text).merge(user_id: params[:user_id], chat_room_id: params[:chat_room_id])
  end
end
