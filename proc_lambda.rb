# Proc and Lambda

Lambda is defined as
() = -> {}

Proc is defined as
Proc.new {}

check_even = ->(n) { n.even? } # => #<Proc:0x007f98031f31d0@(pry):21 (lambda)>

puts check_even === 1 # => false

check_even === 2 # => true

output = (1..10).select(&:even?)
output = (1..10).grep(check_even)

output = (1..10).select(&:even?).map { |n| n * 2 } # # => [4, 8, 12, 16, 20]
output = (1..10).grep(check_even) { |n| n * 2 }