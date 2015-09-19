# Write a program which reverses the words in an input sentence.

File.open(ARGV[0]).each_line do |line|
  if !line.empty?
    words = line.split(/\W+/)
    words.reverse!
    puts words.join(' ')
  end
end
