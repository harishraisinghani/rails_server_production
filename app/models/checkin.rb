class Checkin < ApplicationRecord
  belongs_to :destination
  belongs_to :skier
  validates :skier_id, presence: true
  validates :destination_id, presence:true
end
