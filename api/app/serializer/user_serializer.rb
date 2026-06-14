class UserSerializer
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def as_json(*)
    {
      id: user.id,
      name: user.name,
      email: user.email,
      phone: user.phone
    }
  end
end
