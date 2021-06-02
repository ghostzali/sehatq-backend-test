require 'rails_helper'

RSpec.describe "Api::V1::Roles", type: :request do
  # Create an user & role
  let!(:user) { create(:user_admin) }
  let!(:token) { JsonWebToken.encode({ user_id: user.id, role: user.role.code }) }
  # Add 2 more roles
  let!(:roles) { create_list(:role, 2) }
  let!(:role_id) { roles.first.id }

  describe "GET /roles" do
    before { get '/api/v1/roles', headers: { :Authorization => "Bearer #{token}" } }
    it 'return roles' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end
    it 'return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
