class Patroller < ApplicationRecord
  belongs_to :destination
  has_secure_password
end
