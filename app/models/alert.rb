class Alert < ApplicationRecord
  belongs_to :dispatcher
  belongs_to :patroller
  belongs_to :ping
end
