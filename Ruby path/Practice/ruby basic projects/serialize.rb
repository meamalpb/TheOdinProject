require 'yaml'

# Define a Ruby object to serialize
person = { name: "Alice", age: 30 }

# Serialize the object to YAML format and store it in a string
yaml_string = YAML.dump(person)
puts "Serialized YAML:\n#{yaml_string}\n\n"

# Deserialize the YAML string back into a Ruby object
ruby_object = YAML.load(yaml_string)
puts "Deserialized Ruby object:\n#{ruby_object.inspect}\n\n"
