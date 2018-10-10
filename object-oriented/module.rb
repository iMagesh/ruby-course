module MyStuff
  FRUITS = %W(apple grapes orange banana)
  Test = 1
  def self.apple
      puts "I AM APPLES!"
  end
end

puts MyStuff::FRUITS
puts MyStuff::Test

# require "./module.rb"

# MyStuff.apple
# puts MyStuff::FRUITS