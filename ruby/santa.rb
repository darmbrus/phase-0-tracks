class Santa
    attr_accessor :gender
    attr_reader :ethnicity
    attr_accessor :age
 
    def initialize(gender, ethnicity)
        puts "Initializing Santa instance..."
        @gender = gender
        @ethnicity = ethnicity
        @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", 
            "Prancer", "Vixen", "Comet",
            "Cupid", "Donner", "Blitzen"]
        @age = 0

    end

    def speak()
        puts "Ho, ho, ho! Haaaappy holidays!"
    end

    def eat_milk_and_cookies(cookie_type)
        puts "That was a good cookie"
    end

    def celebrate_birthday()
        @age += 1
    end

    # Getters and setters before refactor
#    def gender
#        @gender
#    end
#
#    def ethnicity
#        @ethnicity
#    end
#
#    def age
#        @age
#    end
#
#    def gender=(value)
#        @gender = value
#    end
#
#    def age=(value)
#        @age = value
#    end

    #Method to move a reindeer to the end of the ranking list
    def get_mad_at(nemesis_name)
        @reindeer_ranking.delete(nemesis_name) 
        @reindeer_ranking << nemesis_name
    end

    def print_reindeer_ranking()
        count = 1
        puts "--- Reindeer Ranking ---"
        @reindeer_ranking.each {|reindeer|
            puts "#{count} #{reindeer}"
            count += 1
        }
    end

    def print_details()
        puts "--- Santa Details ---"
        puts "Gender: #{@gender}"
        puts "Ethnicity: #{@ethnicity}"
        puts "Age: #{@age}"
    end
end

#Initialize default santa parameters
example_genders = ["agender", "female", "bigender",
    "male", "female", "gender fluid",
    "N/A"]
example_ethnicities = ["black", "Latino", "white",
    "Japanese-African", "prefer not to say",
    "Mystical Creature (unicorn)", "N/A"]
number_of_santas = 200
santas = []

#Create santas and place them in an array
number_of_santas.times {
    santas << Santa.new(example_genders.sample, example_ethnicities.sample)
}

#Set the age of each santa randomly between 0-140 years old
santas.each { |santa| santa.age = (rand()*140).to_int }

#Prints out each of the santa's details
santas.each { |santa| santa.print_details() }
