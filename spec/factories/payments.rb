# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  overdued   :boolean          default("false"), not null
#

FactoryGirl.define do
  factory :payment do
    overdued false
    user nil
  end
end
