class Category < ActiveRecord::Base
	before_save :generate_slug
	has_many :items
	# validates :title, presence: true, uniqueness: true

	def generate_slug
		self.slug = title.parameterize
	end
end
