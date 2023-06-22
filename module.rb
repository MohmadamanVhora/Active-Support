require 'active_support'
require 'active_support/core_ext'

### Attributes
# alias_attribute
class User < ApplicationRecord
  # You can refer to the email column as "login".
  alias_attribute :login, :email
end

### Parents
module One
  module Two
    module Three; end
  end
end

# module_parent - returns parent
p One::Two::Three.module_parent     # One::Two
p One::Two.module_parent            # One
# If the module is anonymous or belongs to the top-level, module_parent returns Object
p One.module_parent # Object
puts '------------------------------------------'

# module_parent_name - returns the fully qualified name of the parent module
p One::Two::Three.module_parent_name     # "One::Two"
p One::Two.module_parent_name            # "One"
# If the module is anonymous or belongs to the top-level, module_parent_name returns nil
p One.module_parent_name # nil
puts '------------------------------------------'

# module_parents - module_parent on the receiver and upwards until Object is reached. The chain is returned in an array, from bottom to top
p One::Two::Three.module_parents     # [One::Two, One, Object]
p One::Two.module_parents            # [One, Object]
# If the module is anonymous or belongs to the top-level, module_parent returns Object
p One.module_parents # [Object]
puts '------------------------------------------'

### Anonymous - A module may or may not have a name
module Module1; end
p Module1.name      # "Module1"

Module2 = Module.new
p Module2.name      # "Module2"

p Module.new.name   # nil
puts ''

# We can check whether a module has a name with the predicate anonymous?
p Module1.anonymous?      # false
p Module2.anonymous?      # false
p Module.new.anonymous?   # true

### Method Delegation
# delegate - to access attribute of associated model directly.
# for example - user.profile.name => user.name

class User 
  has_one :profile
  delegate :name, to: :profile # we can access name attribute as user.name

  # we can access multiple attribues also by writing:
  delegate :name, :age, :address, to: :profile

  # By default, if the delegation raises NoMethodError. With :allow_nil the call user.name returns nil if the user has no profile.
  delegate :name, to: :profile, allow_nil: true

  # The option :prefix adds a prefix to the name of the generated method.
  delegate :name, to: :profile, prefix: true  # with prefix true we can access name as user.profile_name

  # we can also configure custom prefix
  delegate :name, to: :profile, prefix: :avatar  # now we can access name as user.avatar_name

  # The delegated methods are public by default. Pass private: true to make private.
  delegate :name, to: :profile, private: true
end
