class Task
  attr_reader :id
  attr_accessor :name, :description, :due_date, :category, :priority

  def initialize(id, name, description, due_date, category, priority)
    @id = id
    @name = name
    @description = description
    @due_date = due_date
    @category = category
    @priority = priority
    @subtasks = []
  end

  def add_subtask(subtask)
    @subtasks << subtask
  end

  def subtasks
    @subtasks
  end
end