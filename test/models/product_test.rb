# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  nombre     :string
#  titulo     :string
#  tipo       :string
#  merge      :string
#  medida     :string
#  hilos      :string
#  carretes   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
