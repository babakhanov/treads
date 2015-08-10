class MessagesController < ApplicationController
  #load_and_authorize_resource :tread
  #load_and_authorize_resource :message, through: :tread

  def create
    if @message.save
      render nothing: true, status: status
      $redis.publish 'rt-change', @message.to_json
    else
      render json: { errors: @message.errors.full_messages }, status: status
    end
  end

  def index
    @messages = Message.where(tread_id: params[:tread_id])
    render json: @messages
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
