=begin
Encrypt:
 for each letter in the password
  check to see if it is a letter or a special char
    if it is a letter
      advance it by one alphabetically
    else
      leave it
    add one to index and repeat
  return encrypted string
Decrypt:
  for each letter in the password
   check to see if it is a letter or a special char
     if it is a letter
       advance it backwards by one alphabetically
     else
       leave it
     add one to index and repeat
   return decrypted string
=end

def encrypt(pw)
  counter = 0
  letters = "abcdefghijklmnopqrstuvwxyz"
  while counter < pw.length
    if letters.index(pw[counter]) != nil
      if pw[counter] == "z"
        pw[counter]= "a"
      else
        pw[counter] = pw[counter].next
      end
    end
    counter += 1
  end
  pw
end

def decrypt(pw)
  counter = 0
  letters = "abcdefghijklmnopqrstuvwxyz"
  while counter < pw.length
    if letters.index(pw[counter]) != nil
      if pw[counter] == "a"
        pw[counter]= "z"
      else
        pw[counter] = letters[letters.index(pw[counter])-1]
      end
    end
    counter += 1
  end
  pw
end


# puts encrypt("abc")
# puts encrypt("zed")
# puts decrypt("bcd")
# puts decrypt("afe")
#
# puts encrypt("abc")
# puts decrypt("abc")
# puts decrypt(encrypt("abc"))
# puts decrypt(encrypt("swordfish"))

# Nested methods work because the computer will always exicute from the inside out and will continue to exicute on the returns until the line is complete.


puts "Would you like to decrypt or encrypt?"
choice = gets.chomp
puts "What is the message?"
pw = gets.chomp

if choice == "encrypt"
  puts "Your encrypted message is: #{encrypt(pw)}"
else
  puts "Your decrypted message is: #{decrypt(pw)}"
end
