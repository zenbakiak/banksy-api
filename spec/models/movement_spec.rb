# frozen_string_literal: true

# == Schema Information
#
# Table name: movements
#
#  id          :bigint           not null, primary key
#  sender_id   :bigint           not null
#  receiver_id :bigint           not null
#  amount      :integer
#  ref         :string
#  concept     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Movement, type: :model do
  subject { FactoryBot.create(:movement) }
  describe 'associations' do
    it { should respond_to(:receiver_id) }
    it { should respond_to(:receiver_username) }
    it { should respond_to(:sender_id) }
    it { should respond_to(:sender_username) }
    it { should respond_to(:amount) }
    it { should respond_to(:ref) }
    it { should respond_to(:concept) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:amount) }
  end
end
