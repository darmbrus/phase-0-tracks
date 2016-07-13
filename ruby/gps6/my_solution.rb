# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# require_reletive allows you to specify a file to include relatively to the
# file that you are currently coding in. Requiring it makes it accessable in the
# code in this file.
#
require_relative 'state_data'

class VirusPredictor
  #The intialize method runs when ever a new instance of the class is created
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
  # Virus effects will call the private methods in the class
  def virus_effects
    predicted_deaths()
    speed_of_spread()
  end

  private
  # Predicted deaths checks the population density and will predict the number
  # of deaths based on certain limits pre defined and will print out the
  # state and the number of deaths to the console
  def predicted_deaths()
    # predicted deaths is solely based on population density
    #if @population_density >= 200
    #  number_of_deaths = (@population * 0.4).floor
    #elsif @population_density >= 150
    #  number_of_deaths = (@population * 0.3).floor
    #elsif @population_density >= 100
    #  number_of_deaths = (@population * 0.2).floor
    #elsif @population_density >= 50
    #  number_of_deaths = (@population * 0.1).floor
    #else
    #  number_of_deaths = (@population * 0.05).floor
    #end
    case @population_density
    when 0..50
      number_of_deaths = (@population * 0.05).floor
    when 51..100
      number_of_deaths = (@population * 0.1).floor
    when 101..150
      number_of_deaths = (@population * 0.2).floor
    when 151..200
      number_of_deaths = (@population * 0.3).floor
    else
      number_of_deaths = (@population * 0.4).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
  # Speed of spread will check the population density and predict the speed
  # at which the virus will spread based on pre-defined values and will print
  # out the speed that is found. There is also an option to
  # modify the initial speed based on the virus.
  def speed_of_spread() #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    # if @population_density >= 200
    #   speed += 0.5
    # elsif @population_density >= 150
    #   speed += 1
    # elsif @population_density >= 100
    #   speed += 1.5
    # elsif @population_density >= 50
    #   speed += 2
    # else
    #   speed += 2.5
    # end

    case @population_density
    when 0..50
      speed += 2
    when 51..100
      speed += 1.5
    when 101..150
      speed += 1
    when 151..200
      speed += 0.5
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


#alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
#alabama.virus_effects
#
#jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
#jersey.virus_effects
#
#california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
#california.virus_effects
#
#alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
#alaska.virus_effects

STATE_DATA.each { |state, values|
  virus_test = VirusPredictor.new("#{state}", values[:population_density],
                         values[:population])
  virus_test.virus_effects()

}

#=======================================================================
# Reflection Section
