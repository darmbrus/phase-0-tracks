#pgs2_2

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
# split up the string
# Add the user input string to the Hash


# set default quantity
# Set the item number

# print the list to the console [can you use one of your other methods here?]
# store the Hash inside another variable and print the result variable by the end of program
# output: [what data type goes here, array or hash?]
# output the hash we created to the user


# Method to add an item to a list
# input: item name and optional quantity
# steps: Ask user to input data, change the input to array, call the list_method and pass the parameters to it.
# output:

# Method to remove an item from the list
# input: remove an item name and quantity
# steps:go inside the list_method, hash key and value remove the selected item
# output: The update list in list_method

# Method to update the quantity of an item
# input:update the quantit of an item
# steps: create a loop to ask for more inputs
# output: call the list_method to print the list

# Method to print a list and make it look pretty
# input: list of items
# steps: get the data from user, Go through the methods
# output: the list


def new_list(items)
  list = {}
  split_items = items.split(' ')
  split_items.each { |item|
    list[item] = 1
  }
  print_list(list)
  list
end

def add_item(list, item, quantity = 1)
  list[item] = quantity
  list
end

def remove_item(list, item)
  list.delete(item)
  list
end

def update_qty(list, item, quantity)

  if list[item] != nil
    list[item] = quantity
  end
  list
end

def print_list(list)
  puts "Current List:"
  if list.length != 0
    list.each { |item, quantity|
      puts "#{item}\t#{quantity}"
    }
  else
    puts "BLANK"
  end
end


testList = new_list("")
testList = add_item(testList, "Lemonade", 2)
testList = add_item(testList, "Tomatoes", 3)
testList = add_item(testList, "Onions", 1)
testList = add_item(testList, "Ice Cream", 4)
testList = remove_item(testList, "Lemonade")
testList = update_qty(testList, "Ice Cream", 1)
print_list(testList)
