class Ping < ApplicationRecord
  belongs_to :checkin
  has_one :alert
  validates :checkin_id, presence: true
  validates :lat, presence: true
  validates :long, presence: true
  validate :coordinate_validation
end
