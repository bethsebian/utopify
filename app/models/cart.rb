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
		contents.map {|item_id, qty| [Item.find(item_id), qty]}
	end

	def total_price
		contents.sum { |item_id, qty| Item.find(item_id).price }
	end
end
