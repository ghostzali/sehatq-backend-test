require 'rails_helper'

RSpec.describe Placement, type: :model do
  it { should belong_to(:hospital) }
  it { should belong_to(:doctor) }
end
