class UserId
  def initialize(value)
    uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
    raise Exception.new("A uuid format is incollect") unless uuid_regex.match?(value.to_s.downcase)
    @value = value
  end

  attr_reader :value
end