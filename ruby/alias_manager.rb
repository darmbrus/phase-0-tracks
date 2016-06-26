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

def swapLetters(full_name)
  split_name = full_name.split(' ')
  split_first_name = split_name[0].split('')
  split_last_name = split_name[1].split('')

  temp = split_last_name[0]
  split_last_name[0] = split_first_name[0]
  split_first_name[0] = temp

  full_name = split_first_name.join('') + ' ' + split_last_name.join('')
end


name_test = swapLetters("david Test")
p name_test
