class Destination < ApplicationRecord
  has_many :patrollers
  has_many :checkins
  validates :name, presence: true
  validates :radius, presence: true #in meters
  validates :lat, presence: true
  validates :long, presence: true
  validate :coordinate_validation
end
