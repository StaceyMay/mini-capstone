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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
