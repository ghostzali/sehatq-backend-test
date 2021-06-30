require 'rails_helper'

RSpec.describe "Orders", type: :request do
  # Create an user & role
  let!(:user) { create(:user_admin) }
  let!(:token) { JsonWebToken.encode({ user_id: user.id, role: user.role.code }) }
  # Add needed entities
  let!(:placement) { create(:placement) }
  let(:hospital_id) { placement.hospital_id }
  let(:doctor_id) { placement.doctor_id }
  let!(:schedule) { create(:schedule) }
  let(:schedule_id) { schedule.id }
  let(:date_day) { (Date.today..Date.today+6).select { |d| schedule.day_name == d.strftime('%A') } }
  let(:params_payload) do {
    :hospital_id => hospital_id,
    :schedule_id => schedule_id,
    :date => date_day.first.iso8601
  } end

  describe "POST /orders" do
    before { post '/api/v1/orders', params: params_payload, headers: { :Authorization => "Bearer #{token}" } }
    it 'return orders create' do
      expect(json).not_to be_empty
    end
    it 'return status 201' do
      expect(response).to have_http_status(201)
    end
  end
end
