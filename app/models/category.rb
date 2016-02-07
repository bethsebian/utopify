class Category < ActiveRecord::Base
	before_save :generate_slug
	has_many :items
	has_many :order_items, through: :items
	# validates :title, presence: true, uniqueness: true

	def generate_slug
		self.slug = title.parameterize
	end

	def self.top_three
		category_sales = {}
		Category.all.each do |category|
			category_sales[category] = category.order_items.count
		end
		all_categories_sorted = category_sales.sort {|a,b| a[1]<=>b[1]}.reverse
		first_three = all_categories_sorted.first(3).map { |category,_| category }
	end
end
