class Santa
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
        @reindeer_ranking.delete(nemesis_name) << nemesis_name
    
    end

    def get_ethnicity()
        @ethnicity
    end

    def set_gender(new_gender)
        @gender = new_gender
    end
end




santas = []
santas << Santa.new("agender", "black")
santas << Santa.new("female", "Latino")


