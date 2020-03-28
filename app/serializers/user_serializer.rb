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
class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :first_name, :last_name, :username

  attribute :balance, if: proc { |obj|
    obj.id == User.current.id
  }
end
