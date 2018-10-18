class Polygon
  @@sides = 10
  def self.sides
    @@sides
  end
end

puts Polygon.sides # => 10

class Triangle < Polygon
  @@sides = 3
end

puts Triangle.sides # => 3
puts Polygon.sides # => 3

# Class Level Instance Variables
class Polygon
  @sides = 10
end
puts Polygon.class_variables # => @@sides
puts Polygon.instance_variables # => @sides

class Polygon
  attr_accessor :sides
  @sides = 10
end
puts Polygon.sides # => NoMethodError: undefined method ‘sides’ for Polygon:Class
puts Polygon.new.sides # => nil

class Polygon
  class << self; attr_accessor :sides end
  @sides = 8
end

puts Polygon.sides # => 8

class Triangle < Polygon
  @sides = 3
end

puts Triangle.sides # => 3
puts Polygon.sides # => 8

class Octogon < Polygon; end
puts Octogon.sides # => nil
