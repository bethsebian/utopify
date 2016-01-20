class Item < ActiveRecord::Base
  belongs_to :travesty
  has_many :order_items
  has_many :reviews
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
