require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  # Create an user & role
  let!(:user) { create(:user_admin) }
  let!(:token) { JsonWebToken.encode({ user_id: user.id, role: user.role.code }) }
  # Add schedules
  let!(:schedules) { create_list(:schedule, 3) }
  describe "GET /schedules" do
    before { get '/api/v1/schedules', headers: { :Authorization => "Bearer #{token}" } }
    it 'return schedules' do
      expect(json).not_to be_empty
      expect(json.size).to eq(7) # 7 days in a week
    end
    it 'return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
