require 'rails_helper'

RSpec.describe "Hospitals", type: :request do
  # Create an user & role
  let!(:user) { create(:user_admin) }
  let!(:token) { JsonWebToken.encode({ user_id: user.id, role: user.role.code }) }
  #Add hospitals
  let!(:hospitals) { create_list(:hospital, 3) }
  describe "GET /hospitals" do
    before { get '/api/v1/hospitals', headers: { :Authorization => "Bearer #{token}" } }
    it 'return hospitals' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end
    it 'return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
