class Doctor < ApplicationRecord
  has_many :schedules
  has_many :placements, dependent: :destroy
  has_many :hospitals, through: :placements
  has_many :orders, through: :schedules
  belongs_to :specialty

  validates :code, :name, presence: true
  validates :code, uniqueness: true
end
