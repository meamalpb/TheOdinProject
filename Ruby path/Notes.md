
 # Numbers
 ## Change of datatypes

```rb

13.to_f #=> 13.0

13.0.to_i #=> 13

```

  

**It’s important to keep in mind that when doing arithmetic with two integers in Ruby, the result will always be an integer.**

```rb

17 / 5 #=> 3, not 3.4

````

 # Strings

 ## Concatenation

 ```rb
"Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"
"Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"
"Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"
```

## Substrings
 ```rb
"hello"[0]      #=> "h"
"hello"[0..1]   #=> "he"
"hello"[0, 4]   #=> "hell"
"hello"[-1]     #=> "o"
 ```

## Interpolation
 ```rb
name = "Odin"
puts "Hello, #{name}" #=> "Hello, Odin"
puts 'Hello, #{name}' #=> "Hello, #{name}"
 ```

## include?
 ```rb
"hello".include?("lo")  #=> true
"hello".include?("z")   #=> false
 ```

## reverse
 ```rb
"hello".reverse  #=> "olleh"
 ```
## split
 ```rb
"hello world".split  #=> ["hello", "world"]
"hello".split("")    #=> ["h", "e", "l", "l", "o"]
 ```

## strip
 ```rb
" hello, world   ".strip  #=> "hello, world"
 ```

 ## Other important methods
  ```rb
"he77o".sub("7", "l")           #=> "hel7o"
"he77o".gsub("7", "l")          #=> "hello"
"hello".insert(-1, " dude")     #=> "hello dude"
"hello world".delete("l")       #=> "heo word"
"!".prepend("hello, ", "world") #=> "hello, world!"
 ```

**Converting other objects to strings**
 ```rb
5.to_s        #=> "5"
nil.to_s      #=> ""
:symbol.to_s  #=> "symbol"
 ```

## chomp
```
chomp(separator=$/) → new_str
```
```rb
#Returns a new String with the given record separator removed from the end of str (if present). 
#If $/ has not been changed from the default Ruby record separator, then chomp also removes carriage return #characters (that is it will remove \n, \r, and \r\n). 
#If $/ is an empty string, it will remove all trailing newlines from the string.

"hello".chomp                #=> "hello"
"hello\n".chomp              #=> "hello"
"hello\r\n".chomp            #=> "hello"
"hello\n\r".chomp            #=> "hello\n"
"hello\r".chomp              #=> "hello"
"hello \n there".chomp       #=> "hello \n there"
"hello".chomp("llo")         #=> "he"
"hello\r\n\r\n".chomp('')    #=> "hello"
"hello\r\n\r\r\n".chomp('')  #=> "hello\r\n\r"
 ```

# Symbols

**Strings can be changed, so every time a string is used, Ruby has to store it in memory even if an existing string with the same value already exists.**
**Symbols, on the other hand, are stored in memory only once, making them faster in certain situations.**
**Create a Symbol**
**To create a symbol, simply put a colon at the beginning of some text:**

 ```rb
:my_symbol
 ```

# Input And Output

## puts and print

 ```rb
irb(main):001:0> print "Hello World"; print "I love drinking coffee"
Hello WorldI love drinking coffee
=> nil

irb(main):002:0> puts "Hello World"; puts "I love drinking coffee"
Hello World
I love drinking coffee
=> nil
 ```

## gets

**gets creates a new line and asks the user to input something, and gets.chomp does the same thing except that it does not create a new line**

 ```rb
puts "Enter a value :"
val = gets
puts val
 ```
```
Enter a value :
This is entered value
This is entered value
 ```
# Files

## File.new
**create a File object using File.new method for reading, writing, or both, according to the mode string. Finally, you can use File.close method to close that file.**
 ```rb
aFile = File.new("filename", "mode")
   # ... process the file
aFile.close
 ```

## File.open
**You can use File.open method to create a new file object and assign that file object to a file.**
 ```rb
File.open("filename", "mode") do |aFile|
   # ... process the file
end
 ```

## sysread
**This statement will output the first 20 characters of the file. The file pointer will now be placed at the 21st character in the file.**
 ```rb
aFile = File.new("input.txt", "r")
if aFile
   content = aFile.sysread(20)
   puts content
else
   puts "Unable to open file!"
end
 ```

## syswrite
**statement will write "ABCDEF" into the file.**
 ```rb
aFile = File.new("input.txt", "r+")
if aFile
   aFile.syswrite("ABCDEF")
else
   puts "Unable to open file!"
end
 ```

## IO.readlines
**In this code, the variable arr is an array. Each line of the file input.txt will be an element in the array arr. Therefore, arr[0] will contain the first line, whereas arr[1] will contain the second line of the file.**
 ```rb
arr = IO.readlines("input.txt")
puts arr[0]
puts arr[1]
 ```

# Directories

## chdir
**To change directory within a Ruby program, use Dir.chdir as follows. This example changes the current directory to /usr/bin.**
```rb
Dir.chdir("/usr/bin")
```

## pwd
**puts Dir.pwd # This will return something like /usr/bin**

## entries
**You can get a list of the files and directories within a specific directory using Dir.entries**
```rb
puts Dir.entries("/usr/bin").join(' ')
```
## Conditionals

**Basic example**

```rb

if attack_by_land == true
  puts "release the goat"
elsif attack_by_sea == true
  puts "release the shark"
else
  puts "release Kevin the octopus"
end
```

## eql? 
**checks both the value type and the actual value it holds.**
```rb

5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true
```

## equal?

**checks whether both values are the exact same object in memory. This can be slightly confusing because of the way computers store some values for efficiency. Two variables pointing to the same number will usually return true.**
```rb
a = 5
b = 5
a.equal?(b) #=> true

a = "hello"
b = "hello"
a.equal?(b) #=> false
```

## Spaceship operator
**<=> (spaceship operator) returns the following:**
**-1 if the value on the left is less than the value on the right;**
**0 if the value on the left is equal to the value on the right; and**
**1 if the value on the left is greater than the value on the right.**
```rb
5 <=> 10    #=> -1
10 <=> 10   #=> 0
10 <=> 5    #=> 1
```

## And and Or
```rb
if 1 < 2 && 5 < 6
  puts "Party at Kevin's!"
end
# This can also be written as
if 1 < 2 and 5 < 6
  puts "Party at Kevin's!"
end
```

## Case statement
```rb
grade = 'F'
did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "'YOU SHALL NOT PASS!' -Gandalf"
end
```

## Unless
**An unless statement works in the opposite way as an if statement: it only processes the code in the block if the expression evaluates to false. There isn’t much more to it.**
```rb
age = 19
unless age < 18
  puts "Get a job."
end
```

## Ternary
```rb
age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."
```

# Loops

## Loop
**Not used that much**
```rb

i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10
end
```

## While Loop
```rb
i = 0
while i < 10 do
 puts "i is #{i}"
 i += 1
end
```

## Until
**reverse of while**
```rb
i = 0
until i >= 10 do
 puts "i is #{i}"
 i += 1
end
```

## Ranges
```rb
(1..5)      # inclusive range: 1, 2, 3, 4, 5
(1...5)     # exclusive range: 1, 2, 3, 4
('a'..'d')  # a, b, c, d
```

## For loop
```rb

for i in 0..5
  puts "#{i} zombies incoming!"
end
```

## Times Loop
```rb
5.times do
  puts "Hello, world!"
end

5.times do |number|
  puts "Alternative fact number #{number}"
end
```

## Upto and Downto Loops
```rb
5.upto(10) {|num| print "#{num} " }     #=> 5 6 7 8 9 10
10.downto(5) {|num| print "#{num} " }   #=> 10 9 8 7 6 5
```

# Arrays

## declaration
```rb
num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]
Array.new               #=> []
Array.new(3)            #=> [nil, nil, nil]
Array.new(3, 7)         #=> [7, 7, 7]
Array.new(3, true)      #=> [true, true, true]
```

## accessing
```rb
str_array = ["This", "is", "a", "small", "array"]

str_array[0]            #=> "This"
str_array[1]            #=> "is"
str_array[4]            #=> "array"
str_array[-1]           #=> "array"
str_array[-2]           #=> "small"
str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
str_array.last(2)       #=> ["small", "array"]
```

## adding removing
```rb
num_array = [1, 2]

num_array.push(3, 4)      #=> [1, 2, 3, 4]
num_array << 5            #=> [1, 2, 3, 4, 5]
num_array.pop             #=> 5
num_array                 #=> [1, 2, 3, 4]

num_array = [2, 3, 4]
#shift and unshift are used to remove and add new elements at the beginning
num_array.unshift(1)      #=> [1, 2, 3, 4]
num_array.shift           #=> 1
num_array                 #=> [2, 3, 4]

num_array = [1, 2, 3, 4, 5, 6]

num_array.pop(3)          #=> [4, 5, 6]
num_array.shift(2)        #=> [1, 2]
num_array                 #=> [3]
```

## adding and subtracting
```rb
a = [1, 2, 3]
b = [3, 4, 5]

a + b         #=> [1, 2, 3, 3, 4, 5]
a.concat(b)   #=> [1, 2, 3, 3, 4, 5]
[1, 1, 1, 2, 2, 3, 4] - [1, 4]  #=> [2, 2, 3]
```

## join
```rb
[1, 2, 3].join          #=> "123"
[1, 2, 3].join("-")     #=> "1-2-3"
```

## enumerate
```rb
users.each_with_index { |item, idx| puts "#{item} with index #{idx}" }
```

# Hash

## declaration
```rb
my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}
```

## accessing
```rb
my_hash["an array"] #=>[1, 2, 3]
#If you try to access a key that doesn’t exist in the hash, it will return nil:
my_hash["hiking"]   #=> nil
```
**similar to get in python**
**hashes have a fetch method that will raise an error when you try to access a key that is not in your hash.**
```rb
shoes.fetch("hiking")   #=> KeyError: key not found: "hiking"
#Alternatively, this method can return a default value instead of raising an error if the given key is not found.
shoes.fetch("hiking", "hiking boots") #=> "hiking boots"
```
## adding and changing data
```rb
shoes = {
  "summer" => "sandals",
  "winter" => "boots"
  }
shoes["fall"] = "sneakers"
shoes     #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}
#You can also use this approach to change the value of an existing key.
shoes["summer"] = "flip-flops"
```
## removing
```rb
shoes.delete("summer") 
```
## getting keys and values list
```rb
books = {
  "Infinite Jest" => "David Foster Wallace",
  "Into the Wild" => "Jon Krakauer"
}

books.keys      #=> ["Infinite Jest", "Into the Wild"]
books.values    #=> ["David Foster Wallace", "Jon Krakauer"]
```

## merging hashes
```rb
hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
hash1.merge(hash2)      #=> { "a" => 100, "b" => 254, "c" => 300 }
```
**one in bracket has priority**

**symbols as keys provide more performant and cleaner syntax**

## 'Rocket' syntax
```rb
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
```
**the below syntax can only be used when using symbols as keys**
```rb
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}
#you need to put :before while giving symbols as keys
american_cars[:ford]    #=> "Mustang"
japanese_cars[:honda]   #=> "Accord"
```

# Methods
**No return keyword while writing method is needed.Ruby is one of the few languages that offers implicit return for methods**

## creating a Method
```rb
def greet(name)
  "Hello, " + name + "!"
end

puts greet("John") #=> Hello, John!
```

## default parameter
```rb
def greet(name = "stranger")
  "Hello, " + name + "!"
end

puts greet("Jane") #=> Hello, Jane!
puts greet #=> Hello, stranger!
```
## explicit return
```rb
def my_name
  return "Joe Smith"
  "Jane Doe"
end

puts my_name #=> "Joe Smith"

```

**an explicit return can be useful when you want to write a method that checks for input errors before continuing.**
```rb
def even_odd(number)
  unless number.is_a? Numeric
    return "A number was not entered."
  end

  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(20) #=>  That is an even number.
puts even_odd("Ruby") #=>  A number was not entered.
```

**if explicit return not given in above pgm, it returns odd when given "ruby" as a parameter**

## chaining methods
```rb
phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
#=> "To be or not to be"
```

## predicate methods
```rb
puts 5.even?  #=> false
puts 12.between?(10, 15)  #=> true
```

## bang methods
```rb
whisper = "HELLO EVERYBODY"
puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"
#clearly you can see that the original variable was not overwritten
puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"
#now when ! is added it is overwritten
```

# Debugging
**In Ruby, errors are also objects.**

## Debugging with puts
**Using puts is a great way to debug, but there’s a HUGE caveat with using it: calling puts on anything that is nil or an empty string or collection will just print a blank line to your terminal.**

**This is one instance where using p will yield more information. As mentioned above, p is a combination of puts and #inspect, the latter of which essentially prints a string representation of whatever it’s called on**

```rb
puts "Using puts:"
puts []
p "Using p:"
p []
```
```
Using puts:
"Using p:"
[]
```

# Debugging with Pry-byebug
**Adding a binding.pry line in our code is similar to creating a breakpoint in JavaScript.**
```rb
require 'pry-byebug'

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end

yell_greeting("bob")
```

**here name is in scope. However, greeting is not in scope, because it is written after binding.pry and has not been evaluated yet.**

```rb
ruby prycheck.rb
rb:17: warning: undefining the allocator of T_DATA class Byebug::ThreadsTable
rb:17: warning: undefining the allocator of T_DATA class Byebug::Context

prycheck.rb:8 Object#yell_greeting:

     3: def yell_greeting(string)
     4:   name = string
     5:
     6:   binding.pry
     7:
 =>  8:   name = name.upcase
     9:   greeting = "WASSAP, #{name}!"
    10:   puts greeting
    11: end
[1] pry(main)> name
=> "bob"
[2] pry(main)> next

prycheck.rb:9 Object#yell_greeting:

     3: def yell_greeting(string)
     4:   name = string
     5:
     6:   binding.pry
     7:
     8:   name = name.upcase
 =>  9:   greeting = "WASSAP, #{name}!"
    10:   puts greeting
    11: end
[2] pry(main)> greeting
=> nil
[3] pry(main)> next

prycheck.rb:10 Object#yell_greeting:

     3: def yell_greeting(string)
     4:   name = string
     5:
     6:   binding.pry
     7:
     8:   name = name.upcase
     9:   greeting = "WASSAP, #{name}!"
 => 10:   puts greeting
    11: end
[3] pry(main)> greeting
=> "WASSAP, BOB!"
```

# Basic Enumerable Methods
## The each Method

**Calling #each on an array will iterate through that array and will yield each element to a code block, where a task can be performed:**
```rb
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }

#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun

#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]
```

```rb { |friend| puts "Hello, " + friend } ``` **is a block, and the code inside this block is run for each element in your array. Because we have 5 friends in our array, this block will be run 5 times, once with each of the 5 elements.**

```rb
#when the operation has logic and not just select everything
my_array = [1, 2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end

#=> The new number is 2.
#=> The new number is 4.

#=> [1, 2]
```

**Each can also be used with hash in the below way**
```rb
my_hash = { "one" => 1, "two" => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }

one is 1
two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }

the pair is ["one", 1]
the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}
```

## The each_with_index Method
```rb
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]
```

## The map Method
```rb
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]
```

## The select Method

**The #select method (also called #filter) passes every item in an array to a block and returns a new array with only the items for which the condition you set in the block evaluated to true.**
```rb
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }

 #=> ["Sharon", "Leo", "Leila", "Arun"]

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}

 ```
# The reduce Method
**it reduces an array or hash down to a single object. You should use #reduce when you want to get an output of a single value.**

*Same code using #each and #reduce*
```rb
my_numbers = [5, 6, 7, 8]
sum = 0

my_numbers.each { |number| sum += number }

sum
#=> 26
```

```rb
my_numbers = [5, 6, 7, 8]

my_numbers.reduce { |sum, number| sum + number }
#=> 26
```

**The first block variable in the #reduce enumerable (sum in this example) is known as the accumulator. The result of each iteration is stored in the accumulator and then passed to the next iteration. The accumulator is also the value that the #reduce method returns at the end of its work. By default, the initial value of the accumulator is the first element in the collection, so for each step of the iteration, we would have the following:**

```
Iteration 0: sum = 5 + 6 = 11
Iteration 1: sum = 11 + 7 = 18
Iteration 2: sum = 18 + 8 = 26
```

```rb
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}
```

# Bang methods with enumerable methods

**without bang**
```rb
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
```
**with bang**
```rb
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
```

# Predicate Enumerable Methods
## The include? Method
```rb
numbers = [5, 6, 7, 8]

numbers.include?(6)
#=> true

numbers.include?(3)
#=> false
```

## any?
```rb
numbers = [21, 42, 303, 499, 550, 811]

numbers.any? { |number| number > 500 }
#=> true

numbers.any? { |number| number < 20 }
#=> false
```

# all?

```rb
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false
```

# none?
```rb
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.none? { |fruit| fruit.length > 10 }
#=> true

fruits.none? { |fruit| fruit.length > 6 }
#=> false
```

# Nester collections

## Nested Arrays

```rb

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]

teacher_mailboxes[0][0]
#=> "Adams"
teacher_mailboxes[1][0]
#=> "Jones"
teacher_mailboxes[2][0]
#=> "Perez"

teacher_mailboxes[0][-1]
#=> "Davis"
teacher_mailboxes[-1][0]
#=> "Perez"
teacher_mailboxes[-1][-2]
#=> "Smith"
```
**If you try to access an index of a nonexistent nested element, it will raise an NoMethodError, because the nil class does not have a [] method. However, just like a regular array, if you try to access a nonexistent index inside of an existing nested element, it will return nil.**

```rb
teacher_mailboxes[3][0]
#=> NoMethodError
teacher_mailboxes[0][4]
#=> nil
```

**If you want a nil value returned when trying to access an index of a nonexistent nested element, you can use the #dig method. This method can also be used when accessing a nonexistent index inside of an existing nested element.**
```rb
teacher_mailboxes.dig(3, 0)
#=> nil
teacher_mailboxes.dig(0, 4)
#=> nil
```

## creation
```rb
mutable = Array.new(3, Array.new(2))
#=> [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
#=> 1000
mutable
#=> [[1000, nil], [1000, nil], [1000, nil]]
```
**Changing the value of the first element in the first nested array, causes the first element to change in all three nested arrays! This same behavior will happen with strings, hashes, or any other mutable objects.**

```rb
immutable = Array.new(3) { Array.new(2) }
#=> [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
#=> 1000
immutable
#=> [[1000, nil], [nil, nil], [nil, nil]]
```

## adding removing
```rb
test_scores << [100, 99, 98, 97]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
test_scores[0].push(100)
#=> [97, 76, 79, 93, 100]
test_scores.pop
#=> [100, 99, 98, 97]
```

## Iterating over a nested array

```rb
teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
  end
end
```
## flatten
**Returns a new array that is a one-dimensional flattening of self (recursively).**
**That is, for every element that is an array, extract its elements into the new array.**
**The optional level argument determines the level of recursion to flatten.**

```rb
teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher} is amazing!"
end
```
```rb
s = [ 1, 2, 3 ]           #=> [1, 2, 3]
t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten(1)              #=> [1, 2, 3, [4, 5]]
```