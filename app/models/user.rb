class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  validates :username, presence: true, uniqueness: { message: "%{value} is already taken. Please choose a different username"}
  enum role: %w(default admin)
end
