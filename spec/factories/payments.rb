# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  amount     :decimal(15, 2)   default("0.0"), not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :payment do
    amount "9.99"
    user nil
  end
end
