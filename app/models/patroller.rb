class Patroller < ApplicationRecord
  has_secure_password
  belongs_to :destination
  has_many :alerts
  validates :destination_id, presence: true
  validates :name, presence: true
  validates :username, presence: true, length: {in: 3..16}
end
