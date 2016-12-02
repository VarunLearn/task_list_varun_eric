require_relative 'task'

class TaskList

  def initialize
    @tasks = []
  end

  def add_task(task)
    if (task.is_a?(Task))
      @tasks << task
    end
  end

  def tasks
    @tasks
  end

  def tasks_complete
    tasks_done = []
    @tasks.each do |variable|
      if variable.done == true
        tasks_done << variable
      end
    end
    tasks_done
  end

  def tasks_incomplete
    tasks_done = []
    @tasks.each do |variable|
      if variable.done == false
        tasks_done << variable
      end
    end
    tasks_done
  end
end
