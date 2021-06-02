class Hospital < ApplicationRecord
  has_many :placements, dependent: :destroy
  has_many :doctors, through: :placements
end
