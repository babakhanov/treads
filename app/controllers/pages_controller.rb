class PagesController < ApplicationController
  def index
    gon.push({ user: current_user })
    render html: "", layout: true
  end
end
