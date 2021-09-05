class UserData
  attr_reader :id, :name, :mail

  def initialize(user)
    @id = user.id.value
    @name = user.name.value
    @mail = user.mail.value
  end

  def to_h
    {
      id: @id,
      name: @name,
      mail: @mail,
    }
  end
end