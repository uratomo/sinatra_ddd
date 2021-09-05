class UserName
  attr_reader :value

  def initialize(value)
    raise Exception.new("A name must be at least 3 characters") if value.size < 3
    @value = value
  end

  def eql?(name)
    return true if @value == name.value

    false
  end
end