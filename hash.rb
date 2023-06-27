require 'active_support'
require 'active_support/core_ext'

### Conversions
# to_xml - returns a string containing an XML representation of its receiver
hash = { a: 1, b: 2, c: 3 }.to_xml
puts hash
# <?xml version="1.0" encoding="UTF-8"?>
# <hash>
#   <a type="integer">1</a>
#   <b type="integer">2</b>
#   <c type="integer">3</c>
# </hash>
puts '--------------------------------'

### Merging
# merge - merge two hashes
hash = { a: 1, b: 2 }
p hash.merge(c: 3, d: 4) # {:a=>1, :b=>2, :c=>3, :d=>4}

# reverse_merge
p hash.reverse_merge(c: 3, d: 4) # {:c=>3, :d=>4, :a=>1, :b=>2}
# merge!, reverse_merge! changes original hash
# reverse_update - same as reverse_merge!

# deep_merge - Returns a new hash with self and other_hash merged recursively.
# deep_merge! changes original hash
p hash.deep_merge!(a: { c: 2, d: 3 }) # {:a=>{:c=>2, :d=>3}, :b=>2}
puts '--------------------------------'

### Deep Duplicating
# deep_dup - Returns a deep copy of hash.
duplicate = hash.deep_dup
duplicate[:a][:c] = 3

p duplicate[:a][:c]     # 3
p hash[:a][:c]          # 2
puts '--------------------------------'

### Working with Keys
# except and except! - Returns a hash that includes everything except given keys.
p hash.except(:a)       # {:b=>2}
p hash.except(:a, :b)   # {}
p hash[:a].except(:c)   # {:d=>3}
puts '--------------------------------'

# stringify_keys and stringify_keys! - Returns a new hash with all keys converted to strings.
p hash.stringify_keys # {"a"=>{:c=>2, :d=>3}, "b"=>2}

# In case of key collision, the value will be the one most recently inserted into the hash:
stringify_hash = { 'a' => 1, a: 2 }.stringify_keys
p stringify_hash # {"a"=>2}

# deep_stringify_keys and deep_stringify_keys! - Returns a new hash with all keys converted to strings. This includes the keys from the root hash and from all nested hashes and arrays.
p hash.deep_stringify_keys # {"a"=>{"c"=>2, "d"=>3}, "b"=>2}
puts '--------------------------------'

# symbolize_keys - Returns a new hash with all keys converted to symbols.
stringify_hash = { 'a' => { 'c' => 2, 'd' => 3 }, 'b' => 2 }
p stringify_hash.symbolize_keys         # {:a=>{"c"=>2, "d"=>3}, :b=>2}
p stringify_hash.deep_symbolize_keys    # {:a=>{:c=>2, :d=>3}, :b=>2}
puts '--------------------------------'
# The methods to_options and to_options! are aliases of symbolize_keys and symbolize_keys!, respectively.

# assert_valid_keys - Validates all keys in a hash match *valid_keys, raising ArgumentError on a mismatch.
p hash.assert_valid_keys(:a, :b) # {:a=>{:c=>2, :d=>3}, :b=>2}
# p hash.assert_valid_keys(:a)          # assert_valid_keys': Unknown key: :b. Valid keys are: :a (ArgumentError)
puts '--------------------------------'

### Working with Values
# deep_transform_values - Returns a new hash with all values converted by the block operation. This includes the values from the root hash and from all nested hashes and arrays.
p(hash.deep_transform_values { |v| v * 3 }) # {:a=>{:c=>6, :d=>9}, :b=>6}
puts '--------------------------------'

### Slicing
# slice! - Replaces the hash with only the given keys. Returns a hash containing the removed key/value pairs.
slicing_hash = { a: 1, b: 2, c: 3, d: 4 }
p slicing_hash.slice!(:a, :d)     # {:b=>2, :c=>3}
p slicing_hash                    # {:a=>1, :d=>4}
puts '--------------------------------'

### Extracting
# extract! - Removes and returns the key/value pairs matching the given keys.
extracting_hash = { a: 1, b: 2, c: 3, d: 4 }
p extracting_hash.extract!(:a, :d)   # {:a=>1, :d=>4}
p extracting_hash                    # {:b=>2, :c=>3}
puts '--------------------------------'

### Indifferent Access
# with_indifferent_access[] - Returns an ActiveSupport::HashWithIndifferentAccess out of its receiver
p hash.with_indifferent_access[:a]    # {"c"=>2, "d"=>3}
p hash.with_indifferent_access['a']   # {"c"=>2, "d"=>3}
