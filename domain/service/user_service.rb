class UserService
  def initialize(repository)
    @repository = repository
  end

  def exists?(user)
    duplicate_user = @repository.find(user.name)
    return true unless duplicate_user.nil?
    return false
  end
end