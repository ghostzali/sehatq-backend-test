class Role < ApplicationRecord
  has_many :users

  validates :code, :name, presence: true, length: { minimum: 3 }
  validates :code, uniqueness: true
end
