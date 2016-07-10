#module Shout
#    def self.yell_angrily(words)
#        words + "!!!" + " :( "
#    end
#
#    def self.yell_happily(words)
#        words + "!!" + " :)"
#    end
#end

module Shout
  def while_running(phrase)
    "<<" + phrase + "<<"
  end

  def while_chasing(phrase)
    "!!" + phrase + "!!"
  end
end

class Kid
  include Shout
end

class Parent
  include Shout
end

timmy = Kid.new()
mom = Parent.new()

puts timmy.while_running("I want to ride that ride")
puts mom.while_chasing("Hey, get back here")

#Driver Code
#puts Shout.yell_angrily("angry")
#puts Shout.yell_happily("happy")
