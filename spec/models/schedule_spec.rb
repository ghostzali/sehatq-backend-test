require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it { should have_many(:orders) }
  it { should belong_to(:doctor) }

  it 'should allow only day name' do
    Date::DAYNAMES.each do |day|
      should allow_value(day).for(:day_name)
    end
  end

  it { should validate_presence_of(:day_name) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
end
