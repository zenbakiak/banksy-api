# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  email           :string
#  first_name      :string
#  last_name       :string
#  balance         :integer          default(0)
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'attributes' do
    it { should respond_to(:email) }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:username) }
    it { should respond_to(:to_jwt) }
    it { should respond_to(:to_param) }
  end

  describe 'associations' do
    it { should have_many(:sent_movements) }
    it { should have_many(:received_movements) }
  end


  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'JWT authentication' do
    let(:user) { FactoryBot.create(:user) }

    it 'should match jwt with verify signin method' do
      signin_validation = User.verify_sign(user.to_jwt)
      expect(signin_validation).to be_truthy
    end
  end
end
