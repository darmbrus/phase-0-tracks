module Shout
    def self.yell_angrily(words)
        words + "!!!" + " :( "
    end

    def self.yell_happily(words)
        words + "!!" + " :)"
    end
end

#Driver Code
puts Shout.yell_angrily("angry")
puts Shout.yell_happily("happy")
