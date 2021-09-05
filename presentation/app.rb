require "sinatra"
require "sinatra/json"
require "json"

require "./domain/service/user_service"

require "./in_memory/user/in_memory_user_repository"

require "./application/user/user_application_service"
require "./application/user/user_create_command"
require "./application/user/user_get_command"

class DDDWebApp < Sinatra::Base
  configure do
    repository = InMemoryUserRepository.new
    user_service = UserService.new(repository)
    app_service = UserApplicationService.new(repository, user_service)
    set :repository, repository
    set :user_service, user_service
    set :app_service, app_service
  end

  get "/user/:name" do
    get_command = UserGetCommand.new(params["name"])
    user = settings.app_service.get(get_command)
    json user.to_h
  end

  post "/user", :provides => "json" do
    body = JSON.parse(request.body.read)
    create_command = UserCreateCommand.new(body["name"], body["mail"])
    user = settings.app_service.create(create_command)
    json user.to_h
  end
end