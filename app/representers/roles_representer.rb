class RolesRepresenter
  def initialize(roles)
    @roles = roles
  end

  def as_json
    roles.map do |role|
      {
        id: role.id,
        code: role.code,
        name: role.name
      }
    end
  end

  private
  attr_reader :roles
end