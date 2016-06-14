def ageCheck(age, year)
  if (age == 2016-year || age == 2016-year-1)
    check =  true
  else
    check = false
  end
  check
end

print "What is your name? "
name = gets
print "How old are you? "
age = gets.to_i
print "What year were you born? "
birthYear = gets.to_i
print "Our company serves galic bread. Should we order some for you ?"
garlicBreadChoice = gets
print "Would you like to enroll in the company's health insurance? "
healthInsuranceChoice = gets

vampire_result = "Results inconclusive"

if (ageCheck(age, birthYear) && garlicBreadChoice == "yes")
  vampire_result = "Probably not a vampire"
  puts "passed"
end


puts vampire_result
