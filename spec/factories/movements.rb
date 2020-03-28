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
FactoryBot.define do
  factory :movement do
    association :sender, factory: :user
    association :receiver, factory: :user
    amount { 1000 }
    concept { FFaker::Product.product }
  end
end
