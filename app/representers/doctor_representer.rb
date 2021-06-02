class DoctorRepresenter
  def initialize(doctor)
    @doctor = doctor
    if @doctor.specialty.nil?
      @doctor.specialty = Specialty.find(@doctor.specialty_id)
    end
  end

  def as_json
    {
      id: doctor.id,
      code: doctor.code,
      name: doctor.name,
      specialty: SpecialtyRepresenter.new(doctor.specialty).as_json
    }
  end

  def as_json_with_schedule
    if doctor.schedules.nil?
      @doctor.schedules = Schedule.where(:doctor_id => doctor.id)
    end
    {
      schedules: doctor.schedules.map { |s| ScheduleRepresenter.new(s).as_json_with_order }
    }
  end

  private
  attr_reader :doctor
end