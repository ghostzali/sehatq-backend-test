class OrdersRepresenter
  def initialize(orders)
    @orders = orders
  end

  def as_json
    orders.map do |order|
      if order.user.nil?
        order.user = User.find(order.user_id)
      end
      {
        id: order.id,
        code: order.code,
        queue_date: order.queue_date,
        queue_number: order.queue_number,
        patient: order.user
      }
    end
  end

  private
  attr_reader :orders
end