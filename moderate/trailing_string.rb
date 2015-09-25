# There are two strings: A and B.
# Print 1 if string B occurs at the end of string A. Otherwise, print 0.

File.open(ARGV[0]).each_line do |line|
  words = line.split(',')
  if words[0].end_with?(words[1].chomp)
    puts '1'
  else puts '0'
  end
end
