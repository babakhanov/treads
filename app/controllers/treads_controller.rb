class TreadsController < ApplicationController

  # hack for show only one tread
  def show
    @tread = Tread.first
    render json: @tread
  end
end
