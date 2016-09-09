class Checkin < ApplicationRecord
  belongs_to :destination
  belongs_to :skier
  has_many :pings
  validates :skier_id, presence: true
  validates :destination_id, presence:true
end
