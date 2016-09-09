class Group < ApplicationRecord
  has_many :memberships
  has_many :skiers, through: :memberships
  validates :admin_id, presence: true
  validates :name, presence: true, length: {in: 3..32}
end
