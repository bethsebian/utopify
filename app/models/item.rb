class Item < ActiveRecord::Base
  before_save :generate_slug
  belongs_to :store
  belongs_to :category
  has_many :order_items
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  default_scope { order(id: :asc) }

  def generate_slug
    self.slug = title.parameterize
  end

end
