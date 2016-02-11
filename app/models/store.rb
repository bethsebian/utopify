class Store < ActiveRecord::Base
  before_save :generate_slug
  belongs_to :user
  has_many :items
  has_many :categories, through: :items
  has_many :order_items, through: :items
  has_many :orders, through: :order_items

  validates :title, presence: true, uniqueness: true

  def item_categories
    self.categories.uniq
  end

  def generate_slug
    self.slug = title.parameterize
  end

  def paid_orders
    self.orders.where(status: "paid")
  end

  def completed_orders
    self.orders.where(status: "completed")
  end

  def cancelled_orders
    self.orders.where(status: "cancelled")
  end

  def pending_orders
    self.orders.where(status: "pending")
  end

  def self.active_stores
    where(status: "active")
  end

  def self.declined_stores
    where(status: "declined")
  end

  def self.pending_stores
    where(status: "pending")
  end
end
