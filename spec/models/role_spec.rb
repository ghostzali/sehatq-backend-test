require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_many(:users) }

  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:name) }

  it { should validate_length_of(:code).is_at_least(3) }
  it { should validate_length_of(:name).is_at_least(3) }

  it { should validate_uniqueness_of(:code).ignoring_case_sensitivity }
end
