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

class Payment < ApplicationRecord
  validates :amount, numericality: true

  belongs_to :user
end
