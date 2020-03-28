# frozen_string_literal: true

class UserSessionSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  attributes :email, :first_name, :last_name, :username, :balance
  attribute :token, &:to_jwt
end
