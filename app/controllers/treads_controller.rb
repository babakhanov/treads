class TreadsController < ApplicationController

  # hack for show only one tread
  def show
    @tread = Tread.find(params[:id])
    render json: @tread
  end

  def index
    @treads = Tread.list(current_user.id)
    render json: @treads, each_serializer: ::TreadShortSerializer
  end

end
