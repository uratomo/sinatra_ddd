
class UserMail
  attr_reader :value

  def initialize(value)
    raise Exception.new("A mail address format is incorrect") unless /.*@.*/.match?(value.to_s)
    @value = value
  end
end