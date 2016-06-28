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
  list.each { |item, quantity|
    puts "#{item}\t#{quantity}"

  }

end


list =  new_list("carrots apples cereal pizza")
p list
list = add_item(list, "orange", 2)
p list
list = add_item(list, "banana")
p list
list = remove_item(list, "banana")
p list
list = update_qty(list, "orange", 3)
p list
list = update_qty(list, "candy", 5)
p list
print_list(list)
