class Calculator

  attr_accessor :a, :b

  def initialize(a,b)
    @a, @b = a,b
  end

  def sum
    @a + @b
  end

  def multiply
    @a * @b
  end

  def divide
    @a/@b
  end

  def show_inputs
    puts "These are the inputs you entered"
    puts "a = #{@a}"
    puts "b = #{@b}"
  end

end

class ScientificCalculator < Calculator
  def initialize(a,b)
    @a = a
    @b = b
  end

  def square_root
    puts "Square root of #{@a} = #{Math.sqrt(@a)}"
    puts "Square root of #{@b} = #{Math.sqrt(@b)}"
  end
end

test = Calculator.new(10,5)
puts test.divide

sample = ScientificCalculator.new(16, 14)
sample.square_root
puts sample.sum

sample = ScientificCalculator.new(16, 14)
sample.a = 10
sample.b = 5
sample.square_root
puts sample.divide