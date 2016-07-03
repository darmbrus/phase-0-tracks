module Shout
    def self.yell_angrily(words)
        words + "!!!" + " :( "
    end

    def self.yell_happily(words)
        words + "!!" + " :)"
    end
end


puts Shout.yell_angrily("angry")
puts Shout.yell_happily("happy")
