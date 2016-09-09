class Checkin < ApplicationRecord
  belongs_to :destination
  belongs_to :skier
end
