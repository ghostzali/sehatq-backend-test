class Order < ApplicationRecord
  belongs_to :schedule
  belongs_to :user

  validates :code, :queue_date, :queue_number, presence: true
  validates :code, uniqueness: true
end
