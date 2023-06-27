require 'active_support'
require 'active_support/core_ext'

# -----Numeric, Integer, and BigDecimal-----

### Numeric
# bytes - They return the corresponding amount of bytes, using a conversion factor of 1024
p 1.kilobyte         # 1024
p 1.megabytes        # 1048576
p 1.gigabytes        # 1073741824
p 1.terabytes        # 1099511627776
p 1.petabytes        # 1125899906842624
p 1.exabytes         # 1152921504606846976
puts '------------------------------------------'

# time - from_now, ago
p 1.day.ago          # 2023-06-20 10:56:39.196953017 +0530
p 1.day.from_now     # 2023-06-22 10:56:39.197051322 +0530
puts ''

p (4.day + 1.week + 8.hours + 35.minutes + 50.seconds).ago          # 2023-06-10 02:20:49.197115719 +0530
p (4.day + 1.week + 8.hours + 35.minutes + 50.seconds).from_now     # 2023-07-02 19:32:29.197164526 +0530
puts ''

p (7.months + 2.years).ago          # 2020-11-21 11:31:34.068878755 +0530
p (7.months + 2.years).from_now     # 2026-01-21 11:31:34.068909847 +0530
puts '------------------------------------------'

# formatting - Enables the formatting of numbers in a variety of ways.
p 9876543210.to_fs(:phone)                                      # "987-654-3210"
p 9876543210.to_fs(:phone, delimiter: ' ', country_code: '91')  # "+91 987 654 3210"
puts ''

p 9876543210.to_fs(:currency)                                   # "$9,876,543,210.00"
puts ''

p 100.to_fs(:percentage)                                        # "100.000%"
p 100.to_fs(:percentage, precision: 0)                          # "100%"
p 325.185749.to_fs(:percentage, precision: 3)                   # "325.186%"
puts ''

p 9876543210.to_fs(:delimited)                                  # "9,876,543,210"
p 9876543210.356.to_fs(:delimited, separator: ' ')              # "9,876,543,210 356"
puts ''

p 153.67780.to_fs(:rounded)                                     # "153.678"
p 153.67780.to_fs(:rounded, precision: 1)                       # "153.7"
p 153.67780.to_fs(:rounded, significant: true)                  # "154"
puts ''

p 987.to_fs(:human_size)                                        # "987 Bytes"
p 987654.to_fs(:human_size)                                     # "965 KB"
p 9876543210.to_fs(:human_size)                                 # "9.2 GB"
p 98765432109876543210.to_fs(:human_size)                       # "85.7 EB"
puts ''

p 987.to_fs(:human)                                             # "987"
p 987654.to_fs(:human)                                          # "988 Thousand"
p 9876543210.to_fs(:human)                                      # "9.88 Billion"
p 98765432109876543210.to_fs(:human)                            # "98800 Quadrillion"
puts '------------------------------------------'

### Integer
# multiple_of? - tests whether an integer is multiple of the argument
p 1565.multiple_of?(5)      # true
p 1565.multiple_of?(3)      # fasle
puts '------------------------------------------'

# ordinal - returns the ordinal suffix string corresponding to the receiver integer
p 1.ordinal      # "st"
p 2.ordinal      # "nd"
p 3.ordinal      # "rd"
p 4.ordinal      # "th"
puts '------------------------------------------'

# ordinalize - returns the ordinal string corresponding to the receiver integer. In comparison, note that the ordinal method returns only the suffix string
p 1.ordinalize      # "1st"
p 2.ordinalize      # "2nd"
p 3.ordinalize      # "3rd"
p 4.ordinalize      # "4th"
puts '------------------------------------------'

### BigDecimal
# to_s - provides a default specifier of "F". BigDecimal(value, precision)
p BigDecimal(109.36589, 3).to_s              # "109.0"
p BigDecimal(109.36589, 3).to_s('e')         # "0.109e3"
p BigDecimal(5.36589, 3).to_s('e')           # "0.537e1"
