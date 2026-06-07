class SubTask
  attr_accessor :name, :description, :due_date, :priority

  def initialize(name, description, due_date, priority)
    @name = name
    @description = description
    @due_date = due_date
    @priority = priority
  end
end