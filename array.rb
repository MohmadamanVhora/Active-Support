require 'active_support'
require 'active_support/core_ext'

# to - returns the subarray of elements up to the one at the passed index
p %w[a b c d].to(2)       # ["a", "b", "c"]
p [].to(2)                # []
puts '------------------------------------------'

# from - returns the tail from the element at the passed index to the end
p %w[a b c d].from(2)     # ["c", "d"]
p %w[a b c d].from(12)    # []
p [].from(2)              # []
puts '------------------------------------------'

p %w[a b c d].third       # "c"
p %w[a b c d].fifth       # nil
puts '------------------------------------------'

# extract! - Removes and returns the elements for which the block returns a true value.
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
p(numbers.extract!(&:even?))    # [0, 2, 4, 6, 8]
p numbers                       # [1, 3, 5, 7, 9]
puts '------------------------------------------'

# extract_options! - Extracts options from a set of arguments. Removes and returns the last element in the array if it's a hash, otherwise returns a blank hash.
p [1, 2, 3, { a: 4 }].extract_options!        # {:a=>4}
p [1, 2, 3, { a: 4 }, 5].extract_options!     # {}
puts '------------------------------------------'

### Conversions
# to_sentence - turns an array into a string containing a sentence that enumerates its items
p [].to_sentence                                        # ""
p %w[Aman Nil].to_sentence(two_words_connector: '-')    # "Aman-Nil"
p %w[Aman Nil Krutik Dhyey].to_sentence                 # "Aman, Nil, Krutik, and Dhyey"
puts '------------------------------------------'

# to_xml - returns a string containing an XML representation of its receiver
puts [1, 2, 3].to_xml
# <?xml version="1.0" encoding="UTF-8"?>
# <integers type="array">
#   <integer type="integer">1</integer>
#   <integer type="integer">2</integer>
#   <integer type="integer">3</integer>
# </integers>
puts '------------------------------------------'

### Wrapping
# Array.wrap wraps its argument in an array unless it is already an array (or array-like)
p Array.wrap(nil)           # []
p Array.wrap([1, 2, 3])     # [1, 2, 3]
p Array.wrap(a: :b)         # [{:a=>:b}]
puts '------------------------------------------'

# Duplicating - deep_dup
array = [1, [2, 3]]
duplicate = array.deep_dup
duplicate[1][1] = 4
p duplicate         # [1, [2, 4]]
p array             # [1, [2, 3]]
puts '------------------------------------------'

### Grouping
# in_groups_of - splits an array into consecutive groups of a certain size. It returns an array with the groups
p [1, 2, 3, 4, 5].in_groups_of(2)             # [[1, 2], [3, 4], [5, nil]]
p [1, 2, 3, 4, 5].in_groups_of(2, 'a')        # [[1, 2], [3, 4], [5, 'a']]
p [1, 2, 3, 4, 5].in_groups_of(2, false)      # [[1, 2], [3, 4], [5]]
puts '------------------------------------------'

# in_groups - splits an array into a certain number of groups. The method returns an array with the groups
p [1, 2, 3, 4, 5].in_groups(2)                # [[1, 2, 3], [4, 5, nil]]
p [1, 2, 3, 4, 5].in_groups(2, 'a')           # [[1, 2, 3], [4, 5, "a"]]
p [1, 2, 3, 4, 5].in_groups(2, false)         # [[1, 2, 3], [4, 5]]
puts '------------------------------------------'

# split - Divides the array into one or more subarrays based on a delimiting value
p [1, 2, 3, 4, 5].split(3)                                  # [[1, 2], [4, 5]]
p [1, 2, 3, 3, 4, 5].split(3)                               # [[1, 2], [], [4, 5]]
p((1..10).to_a.split { |number| number.multiple_of?(4) })   # [[1, 2, 3], [5, 6, 7], [9, 10]]
