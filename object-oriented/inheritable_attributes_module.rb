module ClassLevelInheritableAttributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def inheritable_attributes(*args)
      @inheritable_attributes ||= [:inheritable_attributes]
      @inheritable_attributes += args
      args.each do |arg|
        class_eval %(
          class << self; attr_accessor :#{arg} end
        )
      end
      @inheritable_attributes
    end

    def inherited(subclass)
      @inheritable_attributes.each do |inheritable_attribute|
        instance_var = "@#{inheritable_attribute}"
        subclass.instance_variable_set(instance_var, instance_variable_get(instance_var))
      end
    end
  end
end

class Polygon
  include ClassLevelInheritableAttributes
  inheritable_attributes :sides
  @sides = 8
end

puts Polygon.sides # => 8

class Octogon < Polygon; end

puts Polygon.sides # => 8
puts Octogon.sides # => 8
# Cha-ching

class Polygon
  include ClassLevelInheritableAttributes
  inheritable_attributes :sides, :coolness
  @sides    = 8
  @coolness = 'Very'
end

class Octogon < Polygon; end

puts Octogon.coolness # => 'Very'