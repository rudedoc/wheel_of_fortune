class Spin < ActiveRecord::Base
 belongs_to :user
 belongs_to :location

  def result_status
    if result_time == nil
      "No Result Received"
    else
      result_time.strftime('%b %e, %l:%M:%S')
    end
  end

end
