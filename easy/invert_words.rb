File.open(ARGV[0]).each_line do |line|
  if !line.empty?
    words = line.split(/\W+/)
    words.reverse!
    puts words.join(' ')
  end
end
