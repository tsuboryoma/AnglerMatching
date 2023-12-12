class MessagesController < ApplicationController
  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message = @chat_room.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to chat_room_path(@chat_room)
    else
      # エラーハンドリング（必要に応じて）
      redirect_to chat_room_path(@chat_room), alert: 'メッセージの送信に失敗しました。'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
