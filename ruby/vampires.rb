def ageCheck(age, year)
  if (age == 2016-year || age == 2016-year-1)
    check =  true
  else
    check = false
  end
  check
end

loop do
  # print "What is your name? "
  name = gets.chomp!
  # print "How old are you? "
  age = gets.to_i
  # print "What year were you born? "
  birthYear = gets.to_i
  # print "Our company serves galic bread. Should we order some for you ?"
  garlicBreadChoice = gets.chomp!
  # print "Would you like to enroll in the company's health insurance? "
  healthInsuranceChoice = gets.chomp!

  sunshine_allergy = false
  current_allergy = ""
  vampire_result = "Results inconclusive"

  # Allergies check
  # puts "Please enter allergies one at a time:"
  while (!sunshine_allergy && current_allergy != "done") do
    current_allergy = gets.chomp!
    # puts current_allergy
    if current_allergy == "sunshine"
      sunshine_allergy = true
      vampire_result = "Probably a vampire."
    end
  end

  if !sunshine_allergy
    # If the employee got their age right, and is willing to eat garlic bread or
    # sign up for insurance, the result is “Probably not a vampire.”
    if (ageCheck(age, birthYear) && (garlicBreadChoice == "yes"))
      vampire_result = "Probably not a vampire"
    end

    # If the employee got their age wrong, and hates garlic bread or waives
    # insurance, the result is “Probably a vampire.”
    if (!ageCheck(age, birthYear) && (garlicBreadChoice == "no" || healthInsuranceChoice == "no"))
      vampire_result = "Probably a vampire."
    end

    # If the employee got their age wrong, hates garlic bread, and doesn’t want
    # insurance, the result is “Almost certainly a vampire.”
    if (!ageCheck(age, birthYear) && (garlicBreadChoice == "no" && healthInsuranceChoice == "no"))
      vampire_result = "Almost certainly a vampire."
    end

    # Even if the employee is an amazing liar otherwise, anyone going by the
    # name of “Drake Cula” or “Tu Fang” is clearly a vampire, because come on.
    # In that case, you should print “Definitely a vampire.”
    if (name == "Drake Cula" || name == "Tu Fang")
      vampire_result = "Definitely a vampire."
    end
  end

  # Otherwise, print “Results inconclusive.”
  puts vampire_result

  puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends"

  break if (name == "end")
end
