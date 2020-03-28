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
class User < ApplicationRecord
  has_secure_password

  has_many :sent_movements,
           class_name: 'Movement',
           foreign_key: :sender_id
  has_many :received_movements,
           class_name: 'Movement',
           foreign_key: :receiver_id

  validates :username, :email, :first_name, :last_name, presence: true
  validates :username, length: { minimum: 3 }
  validates :username, :email, uniqueness: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def to_param
    username
  end

  def to_jwt
    JWT.encode({ username: username }, ENV.fetch('JWT_SECRET_KEY'), 'HS256')
  end

  def self.verify_sign(token)
    result = JWT.decode(token, ENV.fetch('JWT_SECRET_KEY'), 'HS256')
    User.find_by(username: result[0]['username'])
  end

  class << self
    attr_writer :current
    # Memoize current user into class method,
    def current
      @current ||= nil
    end
  end
end
