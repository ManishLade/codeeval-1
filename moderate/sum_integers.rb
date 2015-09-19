#Write a program to determine the largest sum of 
#contiguous integers in a list.

# Implementation of the Kadane's algorithm
def max_sub_array(array)
  max_ending_here = array[0]
  max_so_far = max_ending_here
  array.drop(1).each do |i|
    max_ending_here = [i, i + max_ending_here].max
    max_so_far = [max_so_far, max_ending_here].max
  end
  max_so_far
end
File.open(ARGV[0]).each_line do |line|
  array = line.split(',').map(&:to_i)
   puts max_sub_array(array)
end
