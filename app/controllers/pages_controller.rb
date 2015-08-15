class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    render html: "", layout: true
  end
end
