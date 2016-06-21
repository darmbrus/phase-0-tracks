ary = []
p ary
ary << "obj1"
ary << "obj2"
ary << "obj3"
ary << "obj4"
ary << "obj5"
p ary
ary.delete_at(2)
p ary
ary.insert(2, "new_item")
p ary
ary.delete(ary.first)
p ary
p "Is obj5 included in the array?: #{ary.include?("obj5")}"


ary2 = ["test1","test2","test3","test4","test5","test6"]
combine  = ary + ary2
p combine
