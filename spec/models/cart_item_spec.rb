# require 'rails_helper'
#
# RSpec.describe CartItem, type: :model do
#   it "sums line total prices for item in cart" do
# 		db_repo = FactoryJordan.new
#     db_repo.create_travesty(1)
#     item_1 = db_repo.items[0]
#
# 		cart_item = CartItem.new(item_1.id, 2)
#
#     expect(cart_item.line_total_price).to eq(200)
#
#     cart_item.qty = 3
#     expect(cart_item.line_total_price).to eq(300)
#   end
# end
