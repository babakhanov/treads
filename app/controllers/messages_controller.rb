class MessagesController < ApplicationController
  #load_and_authorize_resource :tread
  #load_and_authorize_resource :message, through: :tread
  respond_to :json

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message
      $redis.publish "message", MessageSerializer.new(@message).to_json
    else
      render json: { errors: @message.errors.full_messages }, status: status
    end
  end

  def index
    @messages = Message.includes(:user).where(tread_id: params[:tread_id]).order(created_at: :asc)
    render json: @messages
  end

  private

  def message_params
    params.require(:message).permit(:text, :user_id, :tread_id)
  end
end
