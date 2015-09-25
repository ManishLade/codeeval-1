lines = File.open(ARGV[0])
lines.each_line do |line|
  chomped = line.chomp
  sorted = chomped.chars.sort
  result =  sorted.permutation.map(&:join)
  puts result.join(',')
end
