require_relative 'task_manager'

manager = TaskManager.new

loop do

  puts "\n===== TASK MANAGEMENT SYSTEM ====="

  puts "1. Create Task"
  puts "2. View Tasks"
  puts "3. Create Subtask"
  puts "4. View Subtasks"
  puts "5. Search Task"
  puts "6. Exit"

  print "Enter Choice: "

  choice = gets.chomp.to_i

  case choice

  when 1
    manager.create_task

  when 2
    manager.view_tasks

  when 3
    manager.create_subtask

  when 4
    manager.view_subtasks

  when 5
    manager.search_task

  when 6
    puts "Goodbye!"
    break

  else
    puts "Invalid Choice"

  end

end