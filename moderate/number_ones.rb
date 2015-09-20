# Write a program which determines the number of 1 bits in the internal 
# representation of a given integer.

lines = File.open(ARGV[0])
lines.each_line do |line|
  bin = line.to_i.to_s(2)
  puts bin.scan('1').count
end
