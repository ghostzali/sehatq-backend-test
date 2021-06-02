require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  # Create an user & role
  let!(:user) { create(:user_admin) }
  let!(:token) { JsonWebToken.encode({ user_id: user.id, role: user.role.code }) }
  # Add 9 more users
  let!(:users) { create_list(:user, 9) }
  let!(:user_id) { users.first.id }
  describe "GET /users" do
    before { get '/api/v1/users', headers: { :Authorization => "Bearer #{token}" } }
    it 'return users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
