require 'rspec'
require_relative 'task_list'

describe TaskList do
  # Checks if TaskList is real
  it "has to be real" do
    expect{TaskList.new}.to_not raise_error
  end

  # Story: As a developer, I can add all of my Tasks to a TaskList.
  # Hint: A TaskList has-many Tasks
  # part 1: it initializes with zero Tasks
  it "initializes with zero Tasks in TaskList" do
    expect(TaskList.new.tasks).to be_a(Array)
    expect(TaskList.new.tasks).to eq([])
  end

  # part 2: you can add a Task to a TaskList, but not add something that isn't
  # a Task
  it "adds a Task to array" do
    task = Task.new
    task_list = TaskList.new
    str = "some string"
    expect{task_list.add_task(task)}.to change{task_list.tasks}.from([]).to([task])
    task_list.add_task(str)
    expect(task_list.tasks).to eq([task])
  end

  # Story: As a developer with a TaskList, I can get the completed items.
  it "returns only completed tasks" do
    # Set up two incomplete tasks and two complete tasks for tests and add_task
    # them to TaskList
    taskInc1 = Task.new
    taskInc2 = Task.new
    taskDone1 = Task.new
    taskDone1.set_done
    taskDone2 = Task.new
    taskDone2.set_done
    task_list = TaskList.new
    task_list.add_task taskInc1
    task_list.add_task taskDone1
    task_list.add_task taskInc2
    task_list.add_task taskDone2

    expect(task_list.tasks).to eq([taskInc1, taskDone1, taskInc2, taskDone2])
    expect(task_list.tasks_complete).to eq([taskDone1, taskDone2])
  end

  # Story: As a developer with a TaskList, I can get the incomplete items.
  it "returns only incomplete tasks" do
    # Set up two incomplete tasks and two complete tasks for tests and add_task
    # them to TaskList
    taskInc1 = Task.new
    taskInc2 = Task.new
    taskDone1 = Task.new
    taskDone1.set_done
    taskDone2 = Task.new
    taskDone2.set_done
    task_list = TaskList.new
    task_list.add_task taskInc1
    task_list.add_task taskDone1
    task_list.add_task taskInc2
    task_list.add_task taskDone2

    expect(task_list.tasks).to eq([taskInc1, taskDone1, taskInc2, taskDone2])
    expect(task_list.tasks_incomplete).to eq([taskInc1, taskInc2])
  end
end
