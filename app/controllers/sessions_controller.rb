class SessionsController < Devise::SessionsController

  def create
    puts "Create new WheelSession here!"
    super
  end

  def destroy
    puts "End WheelSession here!"
    super
  end

end