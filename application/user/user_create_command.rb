class UserCreateCommand
  attr_reader :name, :mail

  def initialize(name, mail)
    @name = name
    @mail = mail
  end
end