require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    task_id = task_manager.create({title: "TDD", description: "Learn to Test"})

    task = task_manager.find(task_id)

    assert_equal "TDD", task.title
    assert_equal "Learn to Test", task.description
    assert_equal task_id, task.id
  end

  def test_it_can_find_all_tasks
    task_manager.create({title: "Homework", description: "Work on Robot World"})
    task_manager.create({title: "Read", description: "HTML & CSS"})
    task_manager.create({title: "Merge Conflict", description: "fix the conflict with Task Manager"})

    assert_equal 3, task_manager.all.length
  end

  def test_we_can_find_a_single_task
    task_id = task_manager.create({title: "Fucky", description: "Send that cash"})
    task = task_manager.find(task_id)

    assert_equal "Fucky", task_manager.find(task_id).title
    assert_equal "Send that cash", task_manager.find(task_id).description
  end

  def test_we_can_update_our_tasks
    task_id = task_manager.create({title: "Homework", description: "Work on Robot World"})
    task = task_manager.find(task_id)

    assert_equal "Homework", task_manager.find(task_id).title

    task_manager.update(task_id, {title: "Not Homework"})
    assert_equal "Not Homework", task_manager.find(task_id).title
  end

  def test_it_can_destroy_a_task
    task_id = task_manager.create({title: "Homework", description: "Work on Robot World"})
    assert_equal 1, task_manager.all.length
    task_manager.destroy(task_id)
    assert_equal 0, task_manager.all.size
  end
end
