class PlayController < ApplicationController
  before_filter :authenticate_user!

  def game
    if !location
      flash[:alert] = "Please register #{request.remote_ip} as a location before playing!"
      redirect_to controller: 'home', action: 'index'
    else
      @prizes = Prize.all
      @wheel = true
    end
  end
end
