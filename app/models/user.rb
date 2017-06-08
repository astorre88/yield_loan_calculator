# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 3..20 }

  has_many :payments, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :payments, reject_if: proc { |attributes| attributes[:amount].blank? }, allow_destroy: true
end
