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
class Movement < ApplicationRecord
  belongs_to :sender,
             class_name: 'User',
             foreign_key: :sender_id
  belongs_to :receiver,
             class_name: 'User',
             foreign_key: :receiver_id

  before_create :set_ref

  after_create :update_balances

  validate :sufficient_funds

  validates :amount,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 100
            }

  scope :for_user, lambda { |user|
    where(sender_id: user.id).or(where(receiver_id: user.id))
  }

  scope :recient_first, -> { order(created_at: :desc) }

  delegate :username, to: :sender, prefix: true
  delegate :username, to: :receiver, prefix: true

  def sufficient_funds
    Rails.logger.info sender.balance
    errors.add(:amount, 'Insufficient funds') if amount > sender.balance
  end

  def set_ref
    self.ref = SecureRandom.uuid
  end

  def update_balances
    # add money to receiver balance
    User.update_counters receiver_id, balance: amount
    # substract money from sender balance
    User.update_counters sender_id, balance: amount * -1
  end
end
