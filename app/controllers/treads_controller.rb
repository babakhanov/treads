class TreadsController < ApplicationController

  # hack for show only one tread
  def show
    @tread = Tread.first
    render json: @tread
  end

  def index
    @treads = Tread.joins(:treads_users).where("treads_users.user_id" => current_user.id)
    render json: @treads
  end

end
