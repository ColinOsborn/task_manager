
class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
    table.insert(title: task[:title], description: task[:description])
  end

  def table
    database.from(:tasks).order(:id)
  end

  def all
    table.to_a.map { |task| Task.new(task)}
  end

  def raw_task(id)
    table.where(:id => id).to_a.first
  end

  def find(id)
    Task.new(raw_task(id))
  end

  def update(id, task)
    table.where(:id => id).update(task)
  end

  def destroy(id)
    table.where(:id => id).delete
  end

  def delete_all
    table.delete
  end
end
