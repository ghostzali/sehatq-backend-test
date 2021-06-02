class ScheduleRepresenter
  def initialize(schedule)
    @schedule = schedule
    if @schedule.doctor.nil?
      @schedule.doctor = Doctor.find(@schedule.doctor_id)
    end
  end

  def as_json
    {
      id: schedule.id,
      day_name: schedule.day_name,
      start_time: schedule.start_time.strftime('%H:%M'),
      end_time: schedule.end_time.strftime('%H:%M'),
      doctor: DoctorRepresenter.new(schedule.doctor).as_json
    }
  end

  def as_json_with_order
    if schedule.orders.nil?
      @schedule.orders = Order.includes(:user).where(:schedules => {:id => schedule.id })
    end
    {
      id: schedule.id,
      day_name: schedule.day_name,
      start_time: schedule.start_time.strftime('%H:%M'),
      end_time: schedule.end_time.strftime('%H:%M'),
      orders: OrdersRepresenter.new(schedule.orders).as_json
    }
  end

  private
  attr_reader :schedule
end