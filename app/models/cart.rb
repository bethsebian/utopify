class Cart
	attr_reader :contents

	def initialize(contents)
		@contents = contents || {}
	end

	def add_item(item_id)
    contents[item_id.to_s] ||=0
    contents[item_id.to_s] += 1
  end

	def count_of
		contents.length
	end

	def items
		contents.map do |item_id, qty|
			cart_item = CartItem.new(item_id, qty)
			CartDecorator.new(cart_item)
		end
	end

	def total_price
		items.map { |item| item.line_total_price }.reduce(:+)
	end

	def update_quantity(qty_update_data)
		item_id = qty_update_data["item_id"]
		new_qty = qty_update_data["quantity"].to_i
		contents[item_id] = new_qty
	end

	def delete_item(item_id)
		contents.delete(item_id)
	end
end
