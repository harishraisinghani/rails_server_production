class Alert < ApplicationRecord
  belongs_to :dispatcher
  belongs_to :patroller
  belongs_to :ping
  validates :state, presence: true, inclusion: {in: ["active","inactive"]}
  validates :ping_id, presence: true
  validates :dispatcher_id, presence: true

  before_save :set_patroller_default_value

  private
    def set_patroller_default_value
      self.patroller_id ||= 1 
    end
end
