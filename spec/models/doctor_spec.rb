require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { should have_many(:schedules) }
  it { should belong_to(:specialty) }

  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:code).ignoring_case_sensitivity }
end
