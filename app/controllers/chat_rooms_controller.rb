class ChatRoomsController < ApplicationController
  def show
    #@chat_room = ChatRoom.find(params[:id])
    @chat_room = ChatRoom.find(params[:id])
    if @chat_room.nil?
      # ここでリダイレクト先のパスを指定します（例: root_pathやfishing_trips_pathなど）
      redirect_to root_path, alert: 'チャットルームが見つかりません。'
    else
      @messages = @chat_room.messages
      @message = Message.new
    end
  end
end
