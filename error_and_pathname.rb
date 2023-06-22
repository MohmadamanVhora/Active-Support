require 'active_support'
require 'active_support/core_ext'

# NameError
# missing_name? - which tests whether the exception was raised because of the name passed as argument.
begin
  Hello
rescue NameError => e
  p e.missing_name                        # "Hello"
  p e.missing_name?('Hello')              # true
  p e.missing_name?('HelloWorld')         # false
end
puts '-----------------------------------'

# Pathname existence
p Pathname.new('hash.rb').existence       # #<Pathname:hash.rb>
p Pathname.new('hash.txt').existence      # nil
