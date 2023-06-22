require 'active_support'
require 'active_support/core_ext'

# blank? and present? are completely opposite
puts ''.blank?          # true
puts ''.present?        # false
puts ''

puts ' '.blank?          # true
puts ' '.present?        # false
puts ''

puts 'Aman'.blank?          # false
puts 'Aman'.present?        # true
puts '--------------------------------------------'

# dup - it returns a shallow copy
# duplicable? - it returns true or false
puts 'Aman'.dup             # Aman
puts 'Aman'.duplicable?     # true
puts ''

puts 1.method(:+).duplicable? # false
puts 1.method(:+).dup             # `dup': allocator undefined for Method (TypeError)
puts '--------------------------------------------'

# deep_dup - it returns a deep copy
array = ['Aman']
duplicate = array.dup

puts array          # Aman
puts duplicate      # Aman
puts ''

duplicate.first.gsub!('Aman', 'Vhora')

puts array          # Vhora - It affect the original array
puts duplicate      # Vhora
puts ''

deep_array = ['Aman']
deep_duplicate = deep_array.deep_dup

puts deep_array          # Aman
puts deep_duplicate      # Aman
puts ''

deep_duplicate.first.gsub!('Aman', 'Vhora')

puts deep_array          # Aman - It not affect the original array
puts deep_duplicate      # Vhora
puts '--------------------------------------------'

# try - it try to apply method to the non nil object, if it is nil then it returns nil
number = 123

p number.jest            # undefined method `jest' for 123:Integer (NoMethodError)
p number.try(:jest)      # nil
p number.try!(:jest)     # undefined method `jest' for 123:Integer (NoMethodError)
puts '--------------------------------------------'

# class_eval - it is used for adding methods and attributes to an existing class.
class ClassEval
  def first
    puts 'This is first method'
  end
end

ClassEval.new.first # "This is first method"
ClassEval.new.second        # undefined method `second' for #<ClassEval:0x00007f8f1732aed0> (NoMethodError)
puts ''

ClassEval.class_eval do
  def second
    puts 'This is second method'
  end
end

ClassEval.new.first # "This is first method"
ClassEval.new.second # "This is second method"
puts '--------------------------------------------'

# acts_like? - provides a way to check whether some class acts like some other class. for Date, Time and String classes
date = "#{Date.today}"

puts date.acts_like?(:date)         # true
puts date.acts_like?(:time)         # false
puts date.acts_like?(:string)       # false
puts ''

time = Time.now
puts time.acts_like?(:date)         # false
puts time.acts_like?(:time)         # true
puts time.acts_like?(:string)       # false
puts ''

string = 'Hello'
puts string.acts_like?(:date)       # false
puts string.acts_like?(:time)       # false
puts string.acts_like?(:string)     # true
puts ''

array = %w[Hello world]
puts array.acts_like?(:date)        # false
puts array.acts_like?(:time)        # false
puts array.acts_like?(:string)      # false
puts '--------------------------------------------'

# to_param - return something that represents them as values in a query string, or as URL fragments. on all its elements and joins the result with slashes('/').
p 7.to_param                        # "7"
p [0, true, String].to_param        # "0/true/String"
puts '--------------------------------------------'

# to_query - constructs a query string that associates a given key(attribute) with the return value of to_param.
p 1.to_query(:id)                                     # "id=1"
p 'Aman'.to_query(:name)                              # "name=Aman"
p [0, true, String].to_query(:example)                # "example%5B%5D=0&example%5B%5D=true&example%5B%5D=String"
query = { id: 1, name: 'Aman' }.to_query('user')
p query                                               # "user%5Bid%5D=1&user%5Bname%5D=Aman"
puts '--------------------------------------------'

### Instance variables
# instance_values - returns a hash that maps instance variable names without "@" to their corresponding values.
# instance_variable_names - returns an array. Each name includes the "@" sign.
class InstanceVariable
  def initialize(number1, number2)
    @number1 = number1
    @number2 = number2
  end
end
p InstanceVariable.new(0, 1).instance_values            # {"number1"=>0, "number2"=>1}
p InstanceVariable.new(0, 1).instance_variable_names    # ["@number1", "@number2"]
puts '--------------------------------------------'

# in? - tests if an object is included in another object. An ArgumentError exception will be raised if the argument passed does not respond to include?.
p 2.in?([1, 2, 3])          # true
p 4.in?([1, 2, 3])          # false
p 'el'.in?('hello world')   # true
p 1.in?(1)                  # The parameter passed to #in? must respond to #include? (ArgumentError)
puts '--------------------------------------------'
