class InMemoryUserRepository
  @@users = []

  def find(name)
    @@users.each do |user|
      return user if user.name.eql?(name)
    end

    return nil
  end

  def save(user)
    @@users.push(user)
  end
end