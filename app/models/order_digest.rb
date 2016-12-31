class OrderDigest
  attr_reader :orders

  def initialize
    @orders = Order.all
  end

  def ordered
    Order.where(status: "ordered").count
  end

  def paid
    Order.where(status: "paid").count
  end

  def completed
    Order.where(status: "completed").count
  end

  def cancelled
    Order.where(status: "cancelled").count
  end

end
