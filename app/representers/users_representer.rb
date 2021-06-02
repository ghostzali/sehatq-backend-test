class UsersRepresenter
  def initialize(users)
    @users = users
  end

  def as_json
    users.map do |user|
      {
        id: user.id,
        username: user.username,
        email: user.email,
        fullname: user.fullname,
        role: RoleRepresenter.new(Role.find(user.role_id)).as_json
      }
    end
  end

  private
  attr_reader :users
end