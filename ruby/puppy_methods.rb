# class Puppy
#
#   def fetch(toy)
#     puts "I brought back the #{toy}!"
#     toy
#   end
#
#   def speak(num)
#   	num.times {puts "Woof!"}
#   end
#
#   def roll_over()
#   	puts "*rolls over*"
#   end
#
#   def dog_years(num)
#   	age = num * 7
#   	age
#   end
#
#   def shake_hands()
#   	puts "*paw out*"
#   end
#
#   def initialize
#   	puts "Initializing new puppy instance..."
#   end
#
# end
#
# spot = Puppy.new
# buddy = Puppy.new
#
#
#
# spot.fetch("ball")
# spot.speak(3)
# spot.roll_over()
# age = spot.dog_years(4)
# puts age
# spot.shake_hands()

class Computer

  def initialize()
    turn_on()
  end

  def turn_on()
    puts "booting up!"
  end

  def insert_disk(disk)
    if (disk == "game")
      disk_loading = true
    else
      disk_loading = false
    end
  end
end


com64 = Computer.new
