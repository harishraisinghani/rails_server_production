class Skier < ApplicationRecord
  has_secure_password
  has_one :membership
  has_one :group, through: :membership
  has_many :checkins
  has_many :pings, through: :checkins
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :ec1, presence: true
  validates :ec1phone, presence: true
  validates :username, presence: true, length: {in: 2..16}, uniqueness: true
  validates :phone, presence: true
  validate :email_format_validation

  def email_format_validation
    /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/.match(email)
  end
end
