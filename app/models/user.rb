class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :reviews
  validates :username, presence: true, uniqueness: { message: "%{value} is already taken. Please choose a different username"}
  enum role: %w(default admin)

  def total_purchased
    orders.sum(:total_price)
  end
end
