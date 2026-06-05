require_relative 'task_manager'

manager = TaskManager.new

loop do
  puts "------TASK MANAGEMENT------"
  puts "1.Create Task"
  puts "2.View Task"
  puts "3.Create Subtask"
  puts "4.View Subtask"
  puts "5.Search Task"
  puts "6.Exit"

  print "Enter Choice:"

  choice = gets.chomp.to_i

  case choice
  when  1
    
    manager.create_task

  when 2
    manager.view_task

  when 3
    manager.create_subtask

  when 4
    manager.view_subtask
  end
end