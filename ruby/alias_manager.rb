# pseudocode:
# prompt for a name
# split the name at the space
# read in the first letter of the last name
# replace first letter of last name with first letter of the first name
# replace the first letter of the first name with stored values from last name
# join the strings back with a space
# itterate through the string
# if a vowel is found replace it with the next vowel
# else replace it withe the next letter


# Read the assignment wrong, thought they wanted to swap the first letter of
# each name.... oh well.
# def swapLetters(full_name)
#   split_name = full_name.split(' ')
#   split_first_name = split_name[0].split('')
#   split_last_name = split_name[1].split('')
#
#   temp = split_last_name[0]
#   split_last_name[0] = split_first_name[0]
#   split_first_name[0] = temp
#
#   full_name = split_first_name.join('') + ' ' + split_last_name.join('')
# end

def swapName(full_name)
  split_name = full_name.split(' ')
  temp = split_name[1]
  split_name[1] = split_name[0]
  split_name[0] = temp
  full_name = split_name.join(' ')
end

def nextLetter(full_name)
  vowels = 'aeiou'
  split_letters = full_name.split('')
  split_letters.map! { |letter|
    if letter != " "
      if vowels.index(letter) != nil
        letter = nextVowel(letter)
      else
        letter = nextConsonant(letter)
      end
    else
      # Don't know exactly why this has to be here but I lose my spaces if I
      # don't do it.
      letter = letter
    end
  }
  split_letters.join('')
end

def nextVowel(letter)
  is_uppercase = letter == letter.upcase
  letter.downcase!
  vowels = 'aeiou'
  if letter == 'u'
    letter = 'a'
  else
    letter = vowels[vowels.index(letter)+1]
  end
  if is_uppercase
    letter.upcase
  else
    letter.downcase
  end
end

def nextConsonant(letter)
  is_uppercase = letter == letter.upcase
  letter.downcase!
  consonants = "bcdfghjklmnpqrstvwxyz"
  if letter == 'z'
    letter = 'b'
  else
    letter = consonants[consonants.index(letter)+1]
  end
  if is_uppercase
    letter.upcase
  else
    letter.downcase
  end
end

user_input = []
new_name = ""
new_alias = ""

while new_name != "done"
  puts "Please enter a new name be aliased and stored"
  new_name = gets.chomp
  if new_name != "done"
    new_alias = nextLetter(swapName(new_name))
    puts "Name: #{new_name} Alias: #{new_alias}"  
  end
end
