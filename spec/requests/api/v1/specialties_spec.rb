require 'rails_helper'

RSpec.describe "Specialties", type: :request do
  # Create an user & role
  let!(:user) { create(:user_admin) }
  let!(:token) { JsonWebToken.encode({ user_id: user.id, role: user.role.code }) }
  # Add specialties
  let!(:specialties) { create_list(:specialty, 3) }
  describe "GET /specialties" do
    before { get '/api/v1/specialties', headers: { :Authorization => "Bearer #{token}" } }
    it 'return specialties' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end
    it 'return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
