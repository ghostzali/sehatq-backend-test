require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:role) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:role_id) }

  it { should validate_length_of(:username).is_at_least(3) }
  it { should validate_length_of(:email).is_at_least(3) }

  it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
end
