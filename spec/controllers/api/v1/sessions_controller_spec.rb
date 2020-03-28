# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do

  context 'with valid information' do
    let(:user) { FactoryBot.create(:user) }
    let(:user_params) {{ email: user.email, password: 'changeme' }}

    describe 'POST #create' do
      it 'returns http success after user signin' do
        post :create, params: { user: user_params }
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'with invalid params' do
    let(:invalid_user_params) { { email: "asdf@ee.com" } }
    it 'renders a JSON response with errors if user params are invalid' do
      post :create, params: { user: invalid_user_params }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
