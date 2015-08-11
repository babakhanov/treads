class TreadsController < ApplicationController

  # hack for show only one tread
  def show
    @tread = Tread.find(params[:id])
    render json: @tread
  end

  def index
    @treads = Tread.joins(:treads_users).where("treads_users.user_id" => current_user.id)
    render json: @treads, each_serializer: ::TreadShortSerializer
  end

end
