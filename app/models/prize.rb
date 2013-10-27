class Prize < ActiveRecord::Base
  #TODO: Variable amount of prizes. Active and Deactivated Prizes.

  validates :title, length: { maximum: 14 }
  validates :description, length: { maximum: 38 }

  validates_presence_of :title, :description

  before_destroy :maintain_prize_count

  before_create :maintain_prize_count

  private



  #TODO: Get active record errors to display in view correctly
  def maintain_prize_count
    if Prize.count == 12


      errors[:base] << "Must have 12 Prizes at all time - please edit one instead"

      puts errors.inspect


      false
    end
  end

end
