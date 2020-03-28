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
class MovementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :amount,
             :ref,
             :concept,
             :sender_id,
             :sender_username,
             :receiver_id,
             :receiver_username,
             :created_at
end
