module ApplicationHelper

  def current_location
     Location.where(ip_address: request.remote_ip).first
  end
end
