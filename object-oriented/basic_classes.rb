"Winter is coming".class # => String

[1,2,3].class # => Array

class Dog
  Breeds = %W(german_shepherd, lab, spaniel) # class constant
  @name = "Tony"
  def self.name # class method
    puts @name
  end

  def bark # instance method
    puts "wuff wuff!"
  end
end

# puts Dog.bark
puts dog = Dog.new
puts dog.bark
puts Dog.name
puts Dog::Breeds