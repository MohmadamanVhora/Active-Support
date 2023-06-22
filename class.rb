require 'active_support'
require 'active_support/core_ext'

# class_attribute - declares one or more inheritable class attributes that can be overridden at any level down the hierarchy.
class One
  class_attribute :name
end

class Two < One; end

class Three < Two; end

One.name = 'Aman'
p Two.name    # "Aman"
p Three.name  # "Aman"
puts ''

Two.name = 'Krutik'
p One.name    # "Aman"
p Three.name  # "Krutik"
puts ''

Three.name = 'Dhyey'
p One.name    # "Aman"
p Two.name    # "Krutik"
puts '------------------------------------------'

# Subclasses and Descendants
class First; end
class Second < First; end
class Third < Second; end
class Fourth < First; end

# subclasses - Returns an array with the direct children of self.
p First.subclasses      # [Fourth, Second]
p Second.subclasses     # [Third]
p Third.subclasses      # []
p Fourth.subclasses     # []
puts '------------------------------------------'

# descendants - method returns all classes that are < than its receiver.
p First.descendants      # [Fourth, Second, Third]
p Second.descendants     # [Third]
p Third.descendants      # []
p Fourth.descendants     # []
