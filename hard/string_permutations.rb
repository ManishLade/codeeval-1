# Write a program which prints all the permutations 
# of a string in alphabetical order. We consider that 
# digits < upper case letters < lower case letters.
# The sorting should be performed in ascending order.

lines = File.open(ARGV[0])
lines.each_line do |line|
  chomped = line.chomp
  sorted = chomped.chars.sort
  result =  sorted.permutation.map(&:join)
  puts result.join(',')
end
