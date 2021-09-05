require "uri"

class UserMail
  attr_reader :value

  def initialize(value)
    raise Exception.new("A mail address format is incorrect") unless URI::MailTo::Email_REGEXP.match?(value.to_s)
    @value = value
  end
end