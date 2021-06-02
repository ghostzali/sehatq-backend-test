class OrderRepresenter
  def initialize(order)
    @order = order
    if @order.schedule.nil?
      @order.schedule = Schedule.find(@order.schedule_id)
    end
  end

  def as_json
    {
      id: order.id,
      code: order.code,
      queue_number: order.queue_number,
      queue_date: order.queue_date,
      schedule: ScheduleRepresenter.new(order.schedule).as_json
    }
  end

  private
  attr_reader :order
end