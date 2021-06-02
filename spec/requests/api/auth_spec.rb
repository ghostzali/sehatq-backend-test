require 'rails_helper'

RSpec.describe "Api::Auths", type: :request do
  describe "POST /login" do
    let!(:user) { create(:user_admin) }
    let(:valid_payload) { { username: user.username, password: 'password'} }
    let(:invalid_username) { { username: '', password: 'password'} }
    let(:invalid_password) { { username: user.username, password: ''} }
    context 'when login request is valid' do
      before { post '/api/login', params: valid_payload }
      it 'return success code 200' do
        expect(response).to have_http_status(200)
      end
      it 'success login' do
        expect(json).not_to be_empty
        expect(json['user']).not_to be_empty
        expect(json['token']).not_to be_empty
      end
    end
    context 'when login request with invalid username' do
      before { post '/api/login', params: invalid_username }
      it 'return error message' do
        expect(json).not_to be_empty
        expect(json['error']).to eq('Invalid username or password')
      end
    end
    context 'when login request with invalid password' do
      before { post '/api/login', params: invalid_password }
      it 'return error message' do
        expect(json).not_to be_empty
        expect(json['error']).to eq('Invalid username or password')
      end
    end
  end
  describe 'GET /me' do
    let!(:user) { create(:user_admin) }
    let!(:token) { JsonWebToken.encode({ user_id: user.id, role: user.role.code }) }

    before { get '/api/me', headers: { :Authorization => "Bearer #{token}" } }

    it 'should return login user' do
      expect(json).not_to be_empty
      expect(json['me']).not_to be_empty
    end

  end
end
