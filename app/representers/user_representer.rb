class UserRepresenter
  def initialize(user)
    @user = user
    if @user.role.nil?
      @user.role = Role.find(user.role_id)
    end
  end

  def as_json
    {
      id: user.id,
      username: user.username,
      email: user.email,
      fullname: user.fullname,
      role: RoleRepresenter.new(user.role).as_json
    }
  end

  private
  attr_reader :user
end