class Travesty < ActiveRecord::Base
  before_save :generate_slug
  has_many :items

  def generate_slug
    self.slug = title.parameterize
  end

  def items
    Item.where(travesty_id: id)
  end
end
