require 'active_support'
require 'active_support/core_ext'

# Safe string is one that is marked as being insertable into HTML as is.
# Strings are considered to be unsafe by default.
p ''.html_safe? # false

# We can obtain a safe string with the html_safe method.
string = ''.html_safe
p string.html_safe? # true
puts ''

p '<p>...</p>'.html_safe?   # false
string = '<p>...</p>'.html_safe
p string.html_safe?         # true
puts ''

# If you append onto a safe string, either in-place with concat/<<, or with +, the result is a safe string. Unsafe arguments are escaped:
p 'a'.html_safe + '<' # "a&lt;"

# Safe arguments are directly appended
p 'a'.html_safe + '<'.html_safe? # "a<"
puts '------------------------------------------'

# remove - Returns a new string with all occurrences of the patterns removed.
string = 'Hello World'

p string.remove('Hello')    # " World"
p string.remove('l')        # "Heo Word"
p string                    # "Hello World"
puts '------------------------------------------'

# remove! - Return original string with all occurrences of the patterns removed.
p string.remove!('World')   # "Hello "
p string                    # "Hello "
puts '------------------------------------------'

# squish - Returns the string, first removing all whitespace on both ends of the string, and then changing remaining consecutive whitespace groups into one space each.
# destructive version squish!
string = " \n  Hello\n\r \t World \n    "
p string            # " \n  Hello\n\r \t World \n    "
p string.squish     # "Hello World"
puts '------------------------------------------'

# truncate - returns a copy of its receiver truncated after a given length
p 'Oh dear! Oh dear! I shall be late!'.truncate(22)                   # "Oh dear! Oh dear! I..."
p 'Oh dear! Oh dear! I shall be late!'.truncate(22, separator: '!')   # "Oh dear! Oh dear..."
puts '------------------------------------------'

#  truncate_bytes - returns a copy of its receiver truncated to at most bytesize bytes
p '🔪'.bytesize # 4
p '🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪'.truncate_bytes(20) # "🔪🔪🔪🔪…"

# Ellipsis(...) can be customized with the :omission option
p '🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪'.truncate_bytes(20, omission: '🖖') # "🔪🔪🔪🔪🖖"
puts '------------------------------------------'

#  truncate_words - returns a copy of its receiver truncated after a given number of words
p 'Oh dear! Oh dear! I shall be late!'.truncate_words(3) # "Oh dear! Oh..."
p 'Oh dear! Oh dear! I shall be late!'.truncate_words(3, omission: '🖖') # "Oh dear! Oh🖖"
puts '------------------------------------------'

# inquiry method converts a string into a StringInquirer object making equality checks prettier.
p 'aman'.inquiry.aman?        # true
p 'aman'.inquiry.vhora?       # false
puts '------------------------------------------'

# starts_with? and ends_with?
p 'aman'.starts_with?('a') # true
p 'aman'.ends_with?('n')   # true
puts ''
p 'aman'.starts_with?('m') # false
p 'aman'.ends_with?('a')   # false
puts '------------------------------------------'

# strip_heredoc strips indentation in heredocs.
heredoc = <<-EOS
    This
      is the
  example of
        strip_heredoc
EOS

puts heredoc.strip_heredoc
puts '------------------------------------------'

# indent - method indents the lines in the receiver
p 'aman'.indent(2)                  # "  aman"
p "aman \n vhora".indent(2)         # "  aman \n   vhora"
p "aman \nvhora".indent(2, "\t")    # "\t\taman \n\t\tvhora"
puts '------------------------------------------'

### Access
# at(position) - method returns the character of the string at position 'position'
p 'hello world'.at(0)       # "h"
p 'hello world'.at(3)       # "l"
p 'hello world'.at(-3)      # "r"
p 'hello world'.at(10)      # "d"
p 'hello world'.at(15)      # nil
puts '------------------------------------------'

# from(position) - method returns the substring of the string starting at position 'position'
p 'hello world'.from(0)     # "hello world"
p 'hello world'.from(3)     # "lo world"
p 'hello world'.from(-3)    # "rld"
p 'hello world'.from(9)     # "ld"
p 'hello world'.from(15)    # nil
puts '------------------------------------------'

# to(position) - method returns the substring of the string up to position 'position'
p 'hello world'.to(0)       # "h"
p 'hello world'.to(3)       # "hell"
p 'hello world'.to(-3)      # "hello wor"
p 'hello world'.to(9)       # "hello worl"
p 'hello world'.to(15)      # "hello world"
puts '------------------------------------------'

# first method returns a substring containing the first limit characters of the string
p 'hello world'.first(5)    # "hello"
p 'hello world'.first(9)    # "hello wor"
puts '------------------------------------------'

# last method returns a substring containing the last limit characters of the string
p 'hello world'.last(5)     # "world"
p 'hello world'.last(9)     # "llo world"
puts '------------------------------------------'

### Inflections
# pluralize - returns the plural of its receiver
p 'Employee'.pluralize      # "Employees"
p 'Faculty'.pluralize       # "Faculties"
p 'Student'.pluralize       # "Students"
puts '------------------------------------------'

# singularize - method is the inverse of pluralize
p 'Employees'.singularize   # "Employee"
p 'Faculties'.singularize   # "Faculty"
p 'Students'.singularize    # "Student"
puts '------------------------------------------'

# camelize - returns its receiver in camel case
p 'employee'.camelize       # "Employee"
p 'faculty'.camelize        # "Faculty"
p 'student'.camelize        # "Student"
puts '------------------------------------------'

# underscore - goes the other way around, from camel case to paths
p 'Employee'.underscore     # "employee"
p 'AdminUser'.underscore    # "admin_user"
puts '------------------------------------------'

# titleize - capitalizes the words in the receiver
p 'hello world'.titleize    # "Hello World"
p 'how are you'.titleize    # "How Are You"
puts '------------------------------------------'

# dasherize - replaces the underscores in the receiver with dashes
p 'hello_world'.dasherize    # "hello-world"
p 'how_are_you'.dasherize    # "how-are-you"
puts '------------------------------------------'

# demodulize - returns the very constant name, that is, the rightmost part of it
p 'Product'.demodulize                           # "Product"
p 'Backoffice::Users'.demodulize                 # "Users"
p 'Admin::Hotel::TableReservation'.demodulize    # "TableReservation"
p '::World::Hello'.demodulize                    # "Hello"
puts '------------------------------------------'

# deconstantize - removes the rightmost segment, generally leaving the name of the constant's container
p 'Product'.deconstantize                           # ""
p 'Backoffice::Users'.deconstantize                 # "Backoffice"
p 'Admin::Hotel::TableReservation'.deconstantize    # "Admin::Hotel"
puts '------------------------------------------'

# parameterize - normalizes its receiver in a way that can be used in pretty URLs
p 'Aman Vhora'.parameterize # "aman-vhora"

# To use a custom separator, override the separator argument.
p 'Aman Vhora'.parameterize(separator: '_') # "aman_vhora"
puts '------------------------------------------'

# tableize - is underscore followed by pluralize
p 'Employee'.tableize     # "employee"
p 'AdminUser'.tableize    # "admin_users"
puts '------------------------------------------'

# tableize - is underscore followed by pluralize
p 'Employee'.tableize     # "employees"
p 'AdminUser'.tableize    # "admin_users"
puts '------------------------------------------'

# classify - is the inverse of tableize. It gives you the class name corresponding to a table name
p 'employees'.classify      # "Employee"
p 'admin_users'.classify    # "AdminUser"
puts '------------------------------------------'

# humanize - tweaks an attribute name for display to end users
p 'employee'.humanize       # "Employee"
p 'admin_users'.humanize    # "Admin users"
p 'user_id'.humanize        # "User"
p '_id'.humanize            # "Id"
puts '------------------------------------------'

# foreign_key - gives a foreign key column name from a class name. To do so it demodulizes, underscores, and adds "_id"
p 'employee'.foreign_key                # "employee_id"
p 'AdminUser'.foreign_key               # "admin_user_id"
p 'Backoffice::User'.foreign_key        # "user_id"
puts '------------------------------------------'

### Conversions
# to_date, to_time, to_datetime
p '21-06-2023'.to_date                  # Wed, 21 Jun 2023
p '21-06-2023 10:05:00'.to_time         # 2023-06-21 10:05:00 +0530
p '21-06-2023 10:05:00'.to_datetime     # Wed, 21 Jun 2023 10:05:00 +0000
puts '------------------------------------------'

### Symbols
# starts_with? and ends_with?
p :aman.starts_with?('a')               # true
p :aman.starts_with?('m')               # false
p :aman.ends_with?('n')                 # true
p :aman.ends_with?('m')                 # false
