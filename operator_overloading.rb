class B
  def self.===(other_or_grade)
    self == other_or_grade || (80..89).include?(other_or_grade)
  end
end

puts Array.new(50) { rand(100) }.grep(B)