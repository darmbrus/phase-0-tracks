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

  def get_duration()
    puts "The task will take #{(@date_end - @date_start).to_i} days"
  end

  def raise_priority()
    if @priority < 10
      @priority += 1
    else
      @priority
    end
  end

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
