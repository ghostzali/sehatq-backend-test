require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:schedule) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:queue_date) }
  it { should validate_presence_of(:queue_number) }

  it { should validate_uniqueness_of(:code).ignoring_case_sensitivity }
end
