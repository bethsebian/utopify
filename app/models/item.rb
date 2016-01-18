class Item < ActiveRecord::Base
  belongs_to :travesty

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

end
