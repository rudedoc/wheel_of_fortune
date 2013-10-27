class PlayController < ApplicationController
  before_filter :authenticate_user!

  def game


    @location = Location.where(ip_address: request.remote_ip)
    @prizes = Prize.all
    @wheel = true

  end
end
