
require_relative "../../domain/model/user/user"
require "./domain/model/user/user_name"
require "./domain/model/user/user_mail"
require "./application/user/user_data"

class UserApplicationService
  def initialize(repository, service)
    @repository = repository
    @service = service
  end

  def create(create_command)
    name = UserName.new(create_command.name)
    mail = UserMail.new(create_command.mail)
    user = User.new(name, mail)
    raise Exception.new("A user  already exists") if @service.exists?(user)
    @repository.save(user)
    UserData.new(user)
  end

  def get(get_command)
    name = UserName.new(get_command.name)
    user = @repository.find(name)
    return nil if user.nil?

    UserData.new(user)
  end
end