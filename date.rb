require 'active_support'
require 'active_support/core_ext'

puts '---------------Date----------------'
puts ''

## Date.current - to be today in the current time zone
p Date.current                            # Thu, 22 Jun 2023
puts '-----------------------------------'

date = Date.new(2023, 6, 22)

##  Named Dates
# beginning_of_week, end_of_week
p date.beginning_of_week                  # Mon, 19 Jun 2023
p date.end_of_week                        # Sun, 25 Jun 2023
puts ''

p date.beginning_of_week(:tuesday)        # Tue, 20 Jun 2023
p date.end_of_week(:tuesday)              # Mon, 26 Jun 2023
# beginning_of_week is aliased to at_beginning_of_week and end_of_week is aliased to at_end_of_week.
puts '-----------------------------------'

# monday, sunday
p date.monday                             # Mon, 19 Jun 2023
p date.sunday                             # Sun, 25 Jun 2023
puts '-----------------------------------'

# prev_week, next_week
p date.prev_week                          # Mon, 12 Jun 2023
p date.prev_week(:friday)                 # Fri, 16 Jun 2023
puts ''

p date.next_week                          # Mon, 26 Jun 2023
p date.next_week(:friday)                 # Fri, 30 Jun 2023
puts '-----------------------------------'
# prev_week is aliased to last_week

# beginning_of_month, end_of_month
p date.beginning_of_month                 # Thu, 01 Jun 2023
p date.end_of_month                       # Fri, 30 Jun 2023
puts '-----------------------------------'
# beginning_of_month is aliased to at_beginning_of_month, and end_of_month is aliased to at_end_of_month.

# beginning_of_quarter, end_of_quarter
p date.beginning_of_quarter               # Sat, 01 Apr 2023
p date.end_of_quarter                     # Fri, 30 Jun 2023
puts '-----------------------------------'

# beginning_of_year, end_of_year
p date.beginning_of_year                  # Sun, 01 Jan 2023
p date.end_of_year                        # Sun, 31 Dec 2023
puts '-----------------------------------'

## Other Date Computations
# years_ago, years_since - receives a number of years and returns the same date those many years ago and since respectively
p date.years_ago(3)                       # Mon, 22 Jun 2020
p date.years_since(3)                     # Mon, 22 Jun 2026
puts '-----------------------------------'

# months_ago, months_since
p date.months_ago(3)                      # Wed, 22 Mar 2023
p date.months_since(3)                    # Fri, 22 Sep 2023
puts '-----------------------------------'

# weeks_ago, weeks_since
p date.weeks_ago(4)                       # Thu, 25 May 2023
p date.weeks_since(4)                     # Thu, 20 Jul 2023
puts '-----------------------------------'

# advance - Provides precise Date calculations for years, months, and days. The options parameter takes a hash with any of these keys: :years, :months, :weeks, :days.
p date.advance(years: 2, weeks: 3)        # Sun, 13 Jul 2025
p date.advance(months: 6, days: -8)       # Thu, 14 Dec 2023
puts '-----------------------------------'

## Changing Components
# change - allows you to get a new date which is the same as the receiver except for the given year, month, or day
p date.change(year: 2020, month: 1, day: 1) # Wed, 01 Jan 2020
puts '-----------------------------------'

## Durations - objects can be added to and subtracted from dates
p date - 2.days                           # Tue, 20 Jun 2023
p date + 2.days                           # Sat, 24 Jun 2023
p date - 3.hours                          # 2023-06-21 21:00:00 +0530
puts '-----------------------------------'

## Timestamps
# beginning_of_day, end_of_day
p date.beginning_of_day                   # 2023-06-22 00:00:00 +0530
p date.end_of_day                         # 2023-06-22 23:59:59.999999999 +0530
# beginning_of_day is aliased to at_beginning_of_day, midnight, at_midnight
puts '-----------------------------------'

# ago, since - receives a number of seconds as argument and returns a timestamp those many seconds ago from midnight
p date.ago(20)                            # 2023-06-21 23:59:40 +0530
p date.since(20)                          # 2023-06-22 00:00:20 +0530
puts ''

puts '-------------DateTime--------------'
puts ''

date_time = DateTime.new(2023, 6, 22, 1, 37, 56)
# beginning_of_hour, end_of_hour
p date_time.beginning_of_hour             # Thu, 22 Jun 2023 01:00:00 +0000
p date_time.end_of_hour                   # Thu, 22 Jun 2023 01:59:59 +0000
puts '-----------------------------------'

# beginning_of_minute, end_of_minute
p date_time.beginning_of_minute           # Thu, 22 Jun 2023 01:37:00 +0000
p date_time.end_of_minute                 # Thu, 22 Jun 2023 01:37:59 +0000
puts '-----------------------------------'

# DateTime.current
p DateTime.current                        # Thu, 22 Jun 2023 11:50:36 +0530
puts '-----------------------------------'

# seconds_since_midnight
p date_time.seconds_since_midnight        # 5876
puts '-----------------------------------'

# utc - gives you the same datetime in the receiver expressed in UTC
p date_time                               # Thu, 22 Jun 2023 01:37:56 +0000
p date_time.utc                           # 2023-06-22 01:37:56 UTC
puts '-----------------------------------'

# utc? - says whether the receiver has UTC as its time zone
p DateTime.now.utc?                       # false
p DateTime.now.utc.utc?                   # true
puts '-----------------------------------'

# advance - receives a hash with keys :years, :months, :weeks, :days, :hours, :minutes, and :seconds
p date_time.advance(years: 1, months: 1, days: 1, hours: 1, minutes: 1, seconds: 1) # Tue, 23 Jul 2024 02:38:57 +0000
puts '-----------------------------------'

# change - receives a hash with keys :year, :month, :day, :hour, :min, :sec, :offset
p date_time.change(year: 2002, month: 8, day: 4, hour: 6, min: 14, sec: 56)         # Sun, 04 Aug 2002 06:14:56 +0000
p date_time.change(offset: Rational(4, 24))                                         # Thu, 22 Jun 2023 01:37:56 +0400
# if hours are zeroed, then minutes and seconds are too (unless they have given values)
puts '-----------------------------------'

# Duration - objects can be added to and subtracted from datetimes
p date_time - 2.days                      # Tue, 20 Jun 2023 01:37:56 +0000
p date_time + 2.days                      # Sat, 24 Jun 2023 01:37:56 +0000
p date_time - 3.hours                     # Wed, 21 Jun 2023 22:37:56 +0000
puts ''

puts '---------------Time----------------'
puts ''

time = Time.local(2023, 6, 22, 1, 55, 7)
# Time.current
p Time.current                            # 2023-06-22 12:21:51.29449592 +0530
puts '-----------------------------------'

# all_day, all_week, all_month, all_quarter, and all_year - returns a range representing the respective field
p time.all_day                            # 2023-06-22 00:00:00 +0530..2023-06-22 23:59:59.999999999 +0530
p time.all_week                           # 2023-06-19 00:00:00 +0530..2023-06-25 23:59:59.999999999 +0530
p time.all_month                          # 2023-06-01 00:00:00 +0530..2023-06-30 23:59:59.999999999 +0530
p time.all_quarter                        # 2023-04-01 00:00:00 +0530..2023-06-30 23:59:59.999999999 +0530
p time.all_year                           # 2023-01-01 00:00:00 +0530..2023-12-31 23:59:59.999999999 +0530
puts '-----------------------------------'

# prev_day, next_day
p time.prev_day                           # 2023-06-21 01:55:07 +0530
p time.next_day                           # 2023-06-23 01:55:07 +0530
puts '-----------------------------------'

# prev_month, next_month
p time.prev_month                         # 2023-05-22 01:55:07 +0530
p time.next_month                         # 2023-07-22 01:55:07 +0530
puts '-----------------------------------'

# prev_year, next_year
p time.prev_year                          # 2022-06-22 01:55:07 +0530
p time.next_year                          # 2024-06-22 01:55:07 +0530
puts '-----------------------------------'

# prev_quarter, next_quarter
p time.prev_quarter                       # 2023-03-22 01:55:07 +0530
p time.next_quarter                       # 2023-09-22 01:55:07 +0530
puts '-----------------------------------'

# Duration - objects can be added to and subtracted from time objects
p time - 20.minutes                       # 2023-06-22 01:35:07 +0530
p time + 2.hours                          # 2023-06-22 03:55:07 +0530
p time + 1.week                           # 2023-06-29 01:55:07 +0530
