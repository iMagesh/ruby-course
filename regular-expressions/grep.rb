# Ruby grep filter

# enum.grep(pattern)                  -> array
# enum.grep(pattern) { |obj| block }  -> array

array_of_diff_types = [{a: 1}, [1, 2, 3], 25, 'bob']
array_of_diff_types.grep(Hash) # => [{:a=>1}]
array_of_diff_types.grep(Array) # => [[1, 2, 3]]
array_of_diff_types.grep(Integer) # => [25]
array_of_diff_types.grep(Numeric) # => [25]
array_of_diff_types.grep(String) # => ["bob"]
array_of_diff_types.grep(Symbol) # => []
array_of_diff_types.grep(Object) # => [{:a=>1}, [1, 2, 3], 25, "bob"]
array_of_diff_types.grep(Enumerable) # => [{:a=>1}, [1, 2, 3]]
array_of_diff_types.grep({a: 1}) # => [{:a=>1}]

%w[bob amber john jane aaron michael nikki].select { |n| n[/\Aj/] } # # => ["john", "jane"]
%w[bob amber john jane aaron michael nikki].grep(/\Aj/)
# => ["john", "jane"]
Array.new(50) { rand(100) }.select {|i| (80..89).include?(i)}

Array.new(50) { rand(100) }.grep(80..89)

# It’s worth noting that under hood === uses include? rather than cover

['a','1','b'].select{|x| /^\d*$/ === x}
#we use the “select” method for filtering the elements in an Enumerable object by giving a block as criterion

# output = ['a','1','b'].grep(/^\d*$/)

# output = [1,10,100,1000].grep(1..100) # => [1, 10, 100]

# output = [1,'a',2,'b'].grep(Integer) # => [1,2]

#what we expected is the Ruby files without the extension name
output = ['hello.rb','world.rb','public.html'].select{|x|x=~/\.rb/}.map{|x|x[0..-4]}

# output = ['hello.rb','world.rb','public.html'].grep(/(.*)\.rb/){$1}

# Selective bulk transforming – combination of “select” and “map”

#Among the Ruby methods of Enumerable, normally we use “select” for filtering and use “map” for bulk transforming. But as the examples showed before, the “grep” method can act as a combination of those two methods. Here it is called “selective bulk transforming”. A simple example is to pickup the numeric string and transfer them into Integer instances. See the following two versions for comparison:

output = ['a','1','b','2'].select{|x| /^\d*$/ === x}.map{|x| x.to_i}

output = ['a','1','b','2'].grep(/^\d*$/){|x| x.to_i}

# make them shorter by the &symbol block, the version using “grep” looks more lovely:
output = ['a','1','b','2'].select{|x| /^\d*$/ === x}.map(&:to_i)

output = ['a','1','b','2'].grep(/^\d*$/,&:to_i)


puts output

# Passing a proc inside grep
check_even = ->(n) { n.even? } # => #<Proc:0x007f98031f31d0@(pry):21 (lambda)>

puts check_even === 1 # => false

check_even === 2 # => true

output = (1..10).select(&:even?)
output = (1..10).grep(check_even)

output = (1..10).select(&:even?).map { |n| n * 2 } # # => [4, 8, 12, 16, 20]
output = (1..10).grep(check_even) { |n| n * 2 }