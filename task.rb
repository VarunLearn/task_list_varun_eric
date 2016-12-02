# A superclass for types of tasks for our program
class Task
  # Initialize with an empty title
  def initialize
    @title = ""
    @description = ""
    @done = false
  end

  # Set a task title
  def set_title(title)
    @title = title
  end

  # Set a task description
  def set_description(description)
    @description = description
  end

  # Set a task as done
  def set_done
    @done = true
  end

  # Return the title
  def title
    @title
  end

  # Return the description
  def description
    @description
  end

  # Is the task done?
  def done
    @done
  end

  # To string method
  def to_s
    super
    if @done == false
      ""
    else
      "Title: " + @title + "; Description: " + @description
    end
  end
end
