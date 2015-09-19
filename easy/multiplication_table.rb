#Print out the grade school multiplication table upto 12*12.

(1..12).each do |i|
  (1..12).each do |j|
    res = i * j
    printf('%4s', res)
  end
  puts "\n"
end
