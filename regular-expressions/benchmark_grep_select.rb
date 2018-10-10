require 'rubygems'
require 'benchmark'
test_array = %w(hamburger cheeseburger goatburger veggieburger lettuce tomato ketchup superburger)
Benchmark.bm do |x|
  x.report { 1000000.times { test_array.grep(/burger/) } }
  x.report { 1000000.times { test_array.select { |item| /burger/ === item } } }
end

#     user     system      total        real
# 3.080000   0.010000   3.090000 (  3.122951)
# 3.520000   0.030000   3.550000 (  3.612067)