# Write a program which reads a file and prints to stdout the specified
# number of the longest lines that are sorted based on their length in descending order.

def partial_quick_sort(arr, i, j, k)
  if i < j
    index_pivot = rand(i..j)
    pivot = arr[index_pivot]
    arr.delete_at(index_pivot)
    left, right = arr[i..j].partition { |e| e.size > pivot.size }
    arr[i..j] = left + [pivot] + right
    index = left.size + i
    partial_quick_sort(arr, i, index - 1, k)
    partial_quick_sort(arr, index + 1, j, k) if index < k - 1
  end
end
lines = File.open(ARGV[0])
size = lines.first.to_i
arr = lines.readlines.map(&:strip)
partial_quick_sort(arr, 0, arr.size - 1, size)
puts arr.first(size)
