class TreadsController < ApplicationController
  load_and_authorize_resource

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
