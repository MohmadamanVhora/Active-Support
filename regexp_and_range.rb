require 'active_support'
require 'active_support/core_ext'

### Regexp
# multiline?() - Returns true if the regexp has the multiline flag set.
p(/./.multiline?)  # false
p(/./m.multiline?) # true
puts ''

p Regexp.new('.').multiline?                    # false
p Regexp.new('.', Regexp::MULTILINE).multiline? # true
puts '-----------------------------------'

### Range
# to_s
p (Date.today..Date.tomorrow).to_s              # "2023-06-22..2023-06-23"
p (Date.today..Date.tomorrow).to_s(:db)         # "BETWEEN '2023-06-22' AND '2023-06-23'"
puts '-----------------------------------'

# === and include?
p (1..10) === (2..8)                            # true
p (1..10) === (2..11)                           # false

p (1..10).include?(2..8)                        # true
p (1..10).include?(2..11)                       # false
puts '-----------------------------------'

# overlaps? - says whether any two given ranges have non-void intersection.
p (1..10).overlaps?(0..7)                       # true
p (1..10).overlaps?(7..18)                      # true
p (1..10).overlaps?(11..15)                     # false
