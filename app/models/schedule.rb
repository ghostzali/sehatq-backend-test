class Schedule < ApplicationRecord
  belongs_to :doctor
  has_many :orders

  validates :day_name, :inclusion => {:in => Date::DAYNAMES}
  validates :day_name, :start_time, :end_time, presence: true
end
