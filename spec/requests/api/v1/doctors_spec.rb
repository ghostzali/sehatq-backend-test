require 'rails_helper'

RSpec.describe "Doctors", type: :request do
  # Create an user & role
  let!(:user) { create(:user_admin) }
  let!(:token) { JsonWebToken.encode({ user_id: user.id, role: user.role.code }) }
  # Add doctors
  let!(:doctors) { create_list(:doctor, 3)}
  let(:specialty_id) { doctors.first.specialty_id }

  describe "GET /doctors" do
    before { get '/api/v1/doctors', headers: { :Authorization => "Bearer #{token}" } }
    it 'return doctors' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end
    it 'return status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
