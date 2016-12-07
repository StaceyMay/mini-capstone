# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  subtotal   :integer
#  tax        :integer
#  total      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :subtotal, :tax, :total, presence: true

end
