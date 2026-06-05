require_relative 'task'
require_relative 'subtask'

class TaskManager
  def initialize
    @tasks = []
    @next_id = 1
  end

  def create_task
  print "Task Name: "
  name = gets.chomp

  print "Description: "
  description = gets.chomp

  print "Due Date: "
  due_date = gets.chomp

  print "Category: "
  category = gets.chomp

  print "Priority(L/M/H): "
  priority = gets.chomp.upcase

  task = Task.new(
    @next_id,
    name,
    description,
    due_date,
    category,
    priority,
  )

  @tasks << task
  @next_id += 1

  puts "Task Created Successfully!"
  end

  def view_task
    puts "Tasks"

    puts "ID | Name | Description | Due_Date | Category | Priority |"

    @tasks.each do |task|
      puts "#{task.id} | #{task.name} | #{task.description} | #{task.due_date} | #{task.category} | #{task.priority}"
    end

  def create_subtask
    print "Parent Task ID:"
    task_id = gets.chomp.to_i

    task = tasks.find {|t| t.id == task_id}

    if task
      print "Name:"
      name = gets.chomp

      print "Description:"
      description = gets.chomp

      print "Due_Date:"
      due_date = gets.chomp

      print "Category:"
      category = gets.chomp

      print "Priority(L/M/H):"
      priority = gets.chomp.upcase

    subtask = SubTask.new(
      name,
      description,
      due_date,
      category,
      priority
    )  

    task.add_subtask(subtask)

    puts "subtask added successfully"

    else
      puts "subtask not found"
    end
  end
  def view_subtask
    print "Enter TaskID:"
    task_id = gets.chomp.to_i

    task = tasks.find {|t| t.id == task_id} 

    if task
      puts "SubTask"

      tasks.subtasks.each do |subtask|
        puts "#{subtask.name}, #{subtask.description}, #{subtask.due_date}, #{subtask.category}, #{subtask.priority}"

      end
    else
      puts "subtask not found"  
    end
  end
    


  end
end

