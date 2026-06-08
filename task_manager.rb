require_relative 'task'
require_relative 'subtask'
require 'date'

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

    due_date = nil 
    loop do
      print "Due Date (DD-MM-YYYY): "
      due_date = gets.chomp
      begin
        Date.strptime(due_date, "%d-%m-%Y")
        break
      rescue ArgumentError
        puts "The given date format is wrong"
      end
      
    end

    print "Category: "
    category = gets.chomp

    priority = nil
    loop do
      print "Priority(L/M/H): "
      priority = gets.chomp.capitalize

      if ["L","M","H"].include?(priority)
        break
      else
        puts "The priority doesnt match. Enter valid priority"
      end
      
    end
    

    task = Task.new(
      @next_id,
      name,
      description,
      due_date,
      category,
      priority
    )

    @tasks << task
    @next_id += 1

    puts "Task Created Successfully!"
  end

  def view_tasks
    puts "\nTasks"

    puts "ID | Name | Description | Due Date | Category | Priority"

    @tasks.each do |task|
      puts "#{task.id} | #{task.name} | #{task.description} | #{task.due_date} | #{task.category} | #{task.priority}"
    end
  end

  def create_subtask
    print "Enter Parent Task ID: "
    task_id = gets.chomp.to_i

    task = @tasks.find { |t| t.id == task_id }

    if task
      print "Subtask Name: "
      name = gets.chomp

      print "Description: "
      description = gets.chomp

      due_date = nil
      loop do
        print "Due Date(DD/MM/YYYY): "
        due_date = gets.chomp

        begin
          due_date.strptime(due_date, "%d-%m-%y")
          break
        rescue ArgumentError
          puts "Fix the date format"
        end 
        
      end
      priority = null 
      loop do
        print "Priority: "
        priority = gets.chomp

        if ['L','M','H'].include?(priority)
           break
        else
          puts "The given priority is invalid. enter a valid priority"
        end 
        
      end
      

      subtask = SubTask.new(
        name,
        description,
        due_date,
        priority
      )

      task.add_subtask(subtask)

      puts "Subtask Added Successfully!"
    else
      puts "Task Not Found!"
    end
  end

  def view_subtasks
    print "Enter Task ID: "
    task_id = gets.chomp.to_i

    task = @tasks.find { |t| t.id == task_id }

    if task
      puts "\nSubtasks"

      task.subtasks.each do |subtask|
        puts "#{subtask.name} | #{subtask.description} | #{subtask.due_date} | #{subtask.priority}"
      end
    else
      puts "Task Not Found!"
    end
  end

  def search_task
    puts "1. Search By Name"
    puts "2. Search By Category"
    puts "3. Search By Priority"

    option = gets.chomp.to_i

    case option
    when 1
      print "Enter Name: "
      keyword = gets.chomp.downcase

      results = @tasks.select do |task|
        task.name.downcase.include?(keyword)
      end

    when 2
      print "Enter Category: "
      category = gets.chomp.downcase

      results = @tasks.select do |task|
        task.category.downcase == category
      end

    when 3
      print "Enter Priority: "
      priority = gets.chomp.downcase

      results = @tasks.select do |task|
        task.priority.downcase == priority
      end

    else
      puts "Invalid Option!"
      return
    end

    if results.empty?
      puts "No Tasks Found!"
    else
      results.each do |task|
        puts "#{task.id} | #{task.name}"
      end
    end
  end
end