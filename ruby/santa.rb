class Santa

    def initialize()
        puts "Initializing Santa instance..."

    end

    def speak()
        puts "Ho, ho, ho! Haaaappy holidays!"
    end

    def eat_milk_and_cookies(cookie_type)
        puts "That was a good cookie"
    end


end

chris = Santa.new

chris.speak

chris.eat_milk_and_cookies("Snickerdoodle")
