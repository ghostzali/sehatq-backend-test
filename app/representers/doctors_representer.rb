class DoctorsRepresenter
  def initialize(doctors)
    @doctors = doctors
  end

  def as_json
    doctors.map do |doctor|
      {
        id: doctor.id,
        code: doctor.code,
        name: doctor.name,
        specialty: SpecialtyRepresenter.new(doctor.specialty).as_json
      }
    end
  end

  private
  attr_reader :doctors
end