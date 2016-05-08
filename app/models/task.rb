class Task
  attr_reader :title,
              :description,
              :id

  def initialize(data)
    @id          = data["id"]
    @title       = data["data"]
    @description = data["description"]
  end

end
