class Store < ActiveRecord::Base
  before_save :generate_slug
  has_many :items
  has_one :user
  has_many :order_items, through: :items
  has_many :orders, through: :order_items

  def generate_slug
    self.slug = title.parameterize
  end
end
