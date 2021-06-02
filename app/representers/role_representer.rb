class RoleRepresenter
  def initialize(role)
    @role = role
  end

  def as_json
    {
      id: role.id,
      code: role.code,
      name: role.name
    }
  end

  private
  attr_reader :role
end