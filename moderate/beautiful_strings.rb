File.open(ARGV[0]).each_line do |line|
  line.downcase!.chomp!
  line.gsub!(/[^a-z]/, '')
  occurences = []
  until line.empty?
    letter = line.chr
    occurences << line.count(letter)
    line.gsub!(letter, '')
  end
  occurences.sort!.reverse!
  total = 0
  current_weight = 26
  occurences.each do |occurence|
    total += occurence * current_weight
    current_weight -= 1
  end
  puts total
end
