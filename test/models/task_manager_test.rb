require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_task
    create_tasks(1)

    task = task_manager.find(1)
    assert_equal "a title 1", task.title
    assert_equal "a description 1", task.description
    assert_equal 1, task.id
  end


  def test_can_find_all_tasks
    create_tasks

    tasks = task_manager.all
    task_one = task_manager.find(1)
    task_two = task_manager.find(2)

    assert tasks.is_a?(Array)
    assert_equal 'a title 1', task_one.title
    assert_equal 'a title 2', task_two.title
  end

  def test_can_find_a_task
    create_tasks(1)

    task = task_manager.find(1)
    assert_equal "a title 1", task.title
    assert_equal "a description 1", task.description
    assert_equal 1, task.id
  end

  def can_update_task
    create_tasks(1)

    task_manager.update({
      'title'       => "a new title",
      'description' => "a new description"
    })

    task = task_manager.find(1)
    assert_equal "a new title", task.title
    assert_equal "a new description", task.description
    assert_equal 1, task.id

  end

  def test_can_destroy_task
    create_tasks(1)

    task = task_manager.find(1)
    assert_equal "a title 1", task.title
    assert_equal "a description 1", task.description
    assert_equal 1, task.id

    task_manager.destroy(1)
    begin
      task_manager.find(1)
    rescue NoMethodError
      assert true
    else
      assert false
    end
  end
end
