class Location < ActiveRecord::Base
  validates_uniqueness_of :ip_address
  has_many :spins, dependent:  :destroy
end
