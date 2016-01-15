class CartItem
	attr_reader :object, :id, :title, :description, :image_url, :travesty_title
	attr_accessor :price, :qty

	def initialize(item_id, qty)
		@object = Item.find(item_id)
		@id = item_id
		@title = object.title
		@description = object.description
		@price = object.price
		@image_url = object.image_url
		@travesty_title = object.travesty.title
		@qty = qty
	end

	def line_total_price
		qty * price
	end
end

class CartDecorator < SimpleDelegator
end