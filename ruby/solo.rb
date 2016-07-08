# Project task
#   start date
#   end date
#   priority
#   task name
#   assigned to
# Methods:
#   get duration
#   raise priority
#   assign task
require 'date'

class ProjectTask
# Method: initialize
  # Arguments: start - the start date of the task
  #            finish - the completion date of the task
  #            pri - the priority of the task
  #            assignment - Who the task is assigned to
  def initialize(start, finish, pri, name, assignment)
    parsed_start = start.split('/')
    parsed_end = finish.split('/')
    @date_start = Date.new(
                          parsed_start[2].to_i,
                          parsed_start[0].to_i,
                          parsed_start[1].to_i
                          )
    @date_end = Date.new(
                          parsed_end[2].to_i,
                          parsed_end[0].to_i,
                          parsed_end[1].to_i
                          )
    pri = pri.to_i
    if pri <= 0
      @priority = 0
    elsif pri >= 10
      @priority = 10
    else
      @priority = pri
    end
    @task_name = name
    @assigned_to = assignment
  end
# Method: get_duration
  # Arguments: none
  # Will return the number of days a task is scheduled to take
  def get_duration()
    puts "The task will take #{(@date_end - @date_start).to_i} days"
  end
# Method: raise_priority
  # Arguments: none
  # Will raise the priority of the task by one with in the limits of
  # 0 and 10
  def raise_priority()
    if @priority < 10
      @priority += 1
    else
      @priority
    end
  end
# Method: assign_to
  # Arguments: new_owner - the new owner to be assigned to the task
  # Will change the owner to the value passed in
  def assign_to(new_owner)
    @assigned_to = new_owner
  end
# Method: print_task
  # Arguments: none
  # Will print out the details of the task
  def print_task()
    puts @task_name
    puts "  Assigned to: #{@assigned_to}"
    puts "  Priority:    #{@priority}"
    print "  Start Date:  #{@date_start.month}/"
    print "#{@date_start.day}/"
    puts "#{@date_start.year}"
    print "  End Date:    #{@date_end.month}/"
    print "#{@date_end.day}/"
    puts "#{@date_end.year}"
  end

end


task = ProjectTask.new("7/7/2016", "7/20/2016", "3", "homework", "David")
task.get_duration
task.print_task
task.assign_to("bob")
task.print_task
