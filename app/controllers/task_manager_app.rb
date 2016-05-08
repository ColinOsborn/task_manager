class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("app/controllers/task_manager_app", __dir__)

  get '/' do
    erb :dashboard
  end
end
