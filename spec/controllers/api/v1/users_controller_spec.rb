# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  context 'with valid information' do
    let(:user_params) { FactoryBot.attributes_for(:user) }

    describe 'POST #create' do
      it 'returns http success after creating new user' do
        post :create, params: { user: user_params }
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'with invalid params' do
    let(:invalid_user_params) { { email: "asdfee" } }
    it 'renders a JSON response with errors if new user data is invalid' do
      post :create, params: { user: invalid_user_params }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
