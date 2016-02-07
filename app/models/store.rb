class Store < ActiveRecord::Base
  before_save :generate_slug
  has_many :items

  def generate_slug
    self.slug = title.parameterize
  end
end
