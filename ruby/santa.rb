class Santa
    attr_accessor :gender
    attr_reader :ethnicity
    attr_reader :age
 
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
end

number_of_santas = 50
santas = []
number_of_santas.times { santas << Santa.new(rand(), rand())    }

