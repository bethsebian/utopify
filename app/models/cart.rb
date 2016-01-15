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
		contents.map { |item_id, qty| [Item.find(item_id), qty] }
	end

	def line_total_price(item)
		(Item.find(item.id).price) * contents[item.id.to_s]
	end

	def total_price
		contents.sum do |item_id_string, qty|
			item_object = Item.find(item_id_string.to_i)
			line_total_price(item_object)
		end
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
