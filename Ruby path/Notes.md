
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