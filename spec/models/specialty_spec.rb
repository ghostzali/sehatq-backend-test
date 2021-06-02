require 'rails_helper'

RSpec.describe Specialty, type: :model do
  it { should have_many(:doctors) }
  it { should validate_presence_of(:name) }
end
