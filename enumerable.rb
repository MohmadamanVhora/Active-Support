require 'active_support'
require 'active_support/core_ext'

# sum
p [1, 2, 3, 4, 5].sum                   # 15
p (1..5).sum                            # 15
p [[1, 2], [2, 3], [3, 4]].sum          # [1, 2, 2, 3, 3, 4]
p %w[Aman Vhora].sum                    # "AmanVhora"
hash_sum = { a: 1, b: 2, c: 3 }.sum
p hash_sum                              # [:a, 1, :b, 2, :c, 3]
p((1..10).sum { |n| n * 2 })            # 110
puts '------------------------------------------'

# index_by - Convert an enumerable to a hash, using the block result as the key and the element as the value.
p([1, 2, 3, 4, 5].index_by { |n| n * 2 })      # {2=>1, 4=>2, 6=>3, 8=>4, 10=>5}
p([1, 2, 3, 4, 5].index_by { |n| n + 2 })      # {3=>1, 4=>2, 5=>3, 6=>4, 7=>5}
puts '------------------------------------------'

# index_with - Convert an enumerable to a hash, using the element as the key and the block result as the value.
p([1, 2, 3, 4, 5].index_with { |n| n * 2 })    # {1=>2, 2=>4, 3=>6, 4=>8, 5=>10}
p([1, 2, 3, 4, 5].index_with { |n| n + 2 })    # {1=>3, 2=>4, 3=>5, 4=>6, 5=>7}
puts '------------------------------------------'

# many? - Returns true if the enumerable has more than 1 element
p [1].many?                                    # false
p([1, 2, 3, 4, 5].many?)                       # true
p([1, 2, 3, 4, 5].many? { |n| n < 2 })         # false
p([1, 2, 3, 4, 5].many? { |n| n > 2 })         # true
puts '------------------------------------------'

# exclude? - Returns true if the collection does not include the object.
p [1, 2, 3, 4].exclude?(3)                     # false
p [1, 2, 3, 4].exclude?(5)                     # true
puts '------------------------------------------'

# including - returns a new enumerable that includes the passed elements
p [1, 2, 3, 4].including(5, 6)                 # [1, 2, 3, 4, 5, 6]
p %w[a b].including(5, 6)                      # ["a", "b", 5, 6]
puts '------------------------------------------'

# excluding - Returns a copy of the enumerable excluding the specified elements.
p [1, 2, 3, 4].excluding(2, 4)                 # [1, 3]
p %w[a b].excluding('b')                       # ["a"]
puts '------------------------------------------'

# pluck - extracts the given key from each element
p [{ name: 'a' }, { name: 'b' }, { name: 'c' }].pluck(:name) # ["a", "b", "c"]

# pick - extracts the given key from the first element
p [{ name: 'a' }, { name: 'b' }, { name: 'c' }].pick(:name)   # "a"
