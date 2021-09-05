require 'securerandom'
require './domain/model/user/user_id'
require './domain/model/user/user_name'
require './domain/model/user/user_mail'

class User
  attr_reader :id, :name, :mail

  def initialize(name, mail)
    raise Exception.new("A must be in the UserName class") unless name.is_a?(UserName)
    raise Exception.new("A must be in the UserMail class") unless mail.is_a?(UserMail)
    @id = UserId.new(SecureRandom.uuid)
    @name = name
    @mail = mail
  end

  def self.restore(id, name, mail)
    raise Exception.new("An id must be in the UserId class") unless id.is_a?(UserId)
    raise Exception.new("A name must be in the UserName class") unless name.is_a?(UserName)
    raise Exception.new("A mail must be in the UserMail class") unless mail.is_a?(UserMail)
    @id = id
    @name = name
    @mail = mail
  end

  def change_name(name)
    raise Exception.new("A name must be in the UserName class") unless name.is_a?(UserName)
    @name = name
  end
end