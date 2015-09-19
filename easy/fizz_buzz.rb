def fizz_buzz(x, y, n)
  check_for_out_of_range_errors(x, y, n)
  res = ''
  for i in 1..n
    append = ''
    append = 'F' if i % x == 0
    append += 'B' if i % y == 0
    append = i.to_s if append.empty?
    res += ' ' + append
  end
  res
end

def check_for_out_of_range_errors(x, y, n)
  raise_out_of_range_error('X', x, 1, 20)
  raise_out_of_range_error('Y', y, 1, 20)
  raise_out_of_range_error('N', n, 21, 100)
end

def raise_out_of_range_error(name, number, low, up)
  unless number.between?(low, up)
    fail ArgumentError, name + ' is not on [' + low.to_s + ', ' + up.to_s + '] range'
  end
end

count = File.foreach(ARGV[0]).inject(0) { |c, _line| c + 1 }
fail ArgumentError, 'there are more than 21 test cases' if count > 20
File.open(ARGV[0]).each_line do |line|
  args = line.split(' ')
  puts fizz_buzz(args[0].to_i, args[1].to_i, args[2].to_i)
end
