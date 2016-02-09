class Store < ActiveRecord::Base
  before_save :generate_slug
  has_many :items
  has_one :user
  has_many :order_items, through: :items
  has_many :orders, through: :order_items

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
end
