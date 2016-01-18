class Item < ActiveRecord::Base
  belongs_to :travesty
  has_many :order_items
end