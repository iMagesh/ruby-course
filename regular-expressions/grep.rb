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