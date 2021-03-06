# Write a method that will sum the digits of a positive integer.
# If it is greater than or equal to 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result.
# The result is called a 'digital root'.
# Do not use string conversion within your method.
def digital_root(number)
  return number if number < 10
  root = digital_root(number/10) + digital_root(number%10)
  if root >= 10
    root = digital_root(root)
  end

  root
end

# Write a function that takes a message and an increment amount.
# Output the same letters shifted by that amount in the alphabet.
# Assume lowercase and no punctuation.
# Preserve spaces.
def caesar_cipher(string, shift)
  letters = string.split('')
  alpha = ('a'..'z').to_a
  new_string = ""
  letters.each do |char|
    if char == ' '
      new_string.concat(char)
    else
      idx = alpha.index(char)
      new_idx = (idx+shift)%26
      new_string.concat(alpha[new_idx])
    end
  end
  new_string
  # letters = string.split('')
  # alpha = ('a'..'z').to_a
  # new_string = ""
  # letters.each do |char|
  #   if char == ' '
  #     new_string.concat(char)
  #   else
  #     idx = alpha.index(char)
  #     new_idx = (idx+shift)%26
  #     new_string.concat(alpha[new_idx])
  #   end
  # end
  # new_string
end

# Write a function that takes two strings.
# Return the longest common substring.
def common_substrings(string_one, string_two)
  matrix = Array.new(string_one.length, 0){Array.new(string_two.length, 0)}
  length = 0
  idx = 0
  beg = idx-length+1
  string_one.chars.each_with_index do |char1, i|
    string_two.chars.each_with_index do |char2, j|
      if char1 == char2
        matrix[i][j] = matrix[i-1][j-1] + 1
        if matrix[i][j] > length
          idx = i
          length = matrix[i][j]
        end
      end
    end
  end

  return string_one[beg..idx]

end

# Write a function that takes an array of integers and returns their sum.
# Use recursion.
def sum_rec(numbers)
  return numbers[-1] if numbers.length == 1
  sum_rec(numbers[0...-1]) + numbers[-1]
end

# Write a function that takes n, the length of the sequence.
# Return the first n elements from the fibonnacci sequence as an array.
def fibs(n)
  return [0] if n == 1
  return [0,1] if n == 2
  previous = fibs(n-1)
  next_num = previous[-2] + previous[-1]
  previous.concat([next_num])
  # return [0] if n == 1
  # return [0,1] if n == 2
  # previous = fibs(n-1)
  # next_num = previous[-2] + previous[-1]
  # previous.concat([next_num])

end

# Write a function that takes a string.
# Return true if the string is a palindrome, otherwise return false.
# It should take less time and memory than reversing the string.
def is_palindrome?(string)
  return true if string.length <=1
  halfway_point = string.length/2
  pointer1 = 0
  pointer2 = string.length - 1
  until pointer1 == halfway_point || pointer2 == halfway_point
    return false if string[pointer1] != string[pointer2]
    pointer1 +=1
    pointer2 -=1
  end
  true
  # return true if string.length <=1
  # halfway_point = string.length/2
  # pointer1 = 0
  # pointer2 = string.length - 1
  # until pointer1 == halfway_point || pointer2 == halfway_point
  #   return false if string[pointer1] != string[pointer2]
  #   pointer1 +=1
  #   pointer2 -=1
  # end
  # true
end

# Write a method that takes a string as input.
# It should return true if the input is a valid IPv4 address.
# Valid IPs are anything between '0.0.0.0' and '255.255.255.255'.
def valid_ip?(string)
  nums = string.split('.').map{|num| num.to_i}
  nums.all?{|num| num >=0 && num<=255}
  # nums = string.split('.').map{|num| num.to_i}
  # nums.all?{|num| num >=0 && num<=255}
end

# Implement the Folding Cipher.
# It folds the alphabet in half and uses the adjacent letter.
# a -> z, b -> y, c -> x, m -> n, etc...
def folding_cipher(string)
  folded = Hash[('a'..'z').zip(('a'..'z').to_a.reverse)]
  string.chars.map { |char| folded[char] }.join('')
  # folded = Hash[('a'..'z').zip(('a'..'z').to_a.reverse)]
  # string.chars.map { |char| folded[char] }.join('')
end

# Write a method that finds all the unique substrings for a word.
def uniq_subs(string)
  subs = Set.new
  string.length.times do |i|
    (i...string.length).each do |j|
      subs.add(string[i..j])
    end
  end
  subs.to_a
end

# Given an array of integers find the largest contiguous subsum.
# You can solve this trivially in O(n**2) time by considering all subarrays.
# Try to solve it in O(n) time with O(1) memory.
def lcs(array)
  sum = 0
  max = array.first || 0
  array.each do |el|
    sum += el
    if max < sum
      max = sum
    end
    sum = 0 if sum < 0
  end
  max
end

# Write a function that takes a year as a four digit integer.
# Returns an array of the 10 closest subsequent silly years.
# A silly year's first two digits plus the last two digits equal the middle two.
def silly_years(year)
  silly_arr = []
  current_year = year+1
  until silly_arr.length == 10
    digits = current_year.to_s.split('')
    first_two = digits[0..1].join('').to_i
    last_two = digits[-2..-1].join('').to_i
    middle_two = digits[1..2].join('').to_i
    if first_two + last_two == middle_two
      silly_arr << current_year
    end
    current_year += 1
  end
  silly_arr
end

# Take an array of integers, and integer k.
# Return all pairs that sum to k exactly.
# List the pairs in [min, max] order.
# Time complexity: O(n).
# Return a set.
def pair_sum(array, k)
  #for each element in the array, find the target number to sum to k
  pairs = Set.new
  seen = Set.new
  array.each do |el|
    num = k-el
    if seen.include?(num)
      pairs.add([[el, num].min, [el,num].max])
    end
    seen.add(el)
  end
  pairs
end

# Take a matrix of integers and coordinates.
# The coordinates represent a rectangular region within the matrix
# Find the sum of numbers falling inside the rectangle.
# Time complexity: O(number of rows * number of columns).
def matrix_region_sum(matrix, top_left_coords, bottom_right_coords)
  total = 0

  (top_left_coords[0]..bottom_right_coords[0]).each do |row_idx|
    (top_left_coords[1]..bottom_right_coords[1]).each do |col_idx|
      total += matrix[row_idx][col_idx]
    end
  end

  total
end

# Implement Merge Sort
# Hint: This typically involves a helper function.
def merge_sort(array)
  return array if array.length < 2
  middle = array.length/2
  left, right = array.take(middle), array.drop(middle)
  sorted_left, sorted_right = merge_sort(left), merge_sort(right)
  merge(sorted_left, sorted_right)
  # return array if array.count < 2
  #
  # middle = array.count / 2
  # left, right = array.take(middle), array.drop(middle)
  #
  # sorted_left, sorted_right = merge_sort(left), merge_sort(right)
  #
  # merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    merged << ((left.first < right.first) ? (left.shift) : right.shift)
  end

  merged + left + right
  # merged = []
  # until left.empty? || right.empty?
  #   merged <<
  #     ((left.first < right.first) ? (left.shift) : (right.shift))
  # end
  #
  # merged + left + right
end

# Implement binary search.
# Return nil if the target isn't found.
def binary_search(array, target)
  return nil if array.length == 0
  midpoint = array.length/2
  case target <=> array[midpoint]
  when -1
    binary_search(array.take(midpoint), target)
  when 0
    midpoint
  when 1
    ans = binary_search(array.drop(midpoint + 1), target)
    if ans.nil?
      nil
    else
      ans + midpoint + 1
    end
  end
end

  # return nil if array.count == 0
  #
  # midpoint = array.length / 2
  # case target <=> array[midpoint]
  # when -1
  #   binary_search(array.take(midpoint), target)
  # when 0
  #   midpoint
  # when 1
  #   subproblem_answer =
  #     binary_search(array.drop(midpoint + 1), target)
  #   subproblem_answer.nil? ? nil : (midpoint + 1) + subproblem_answer
  # end


# You are given a list of numbers in an array.
# Replace all the numbers with the product of all other numbers.
# Do this in O(n) time without using division.
def productify(array)
  products = Array.new(arr.length, 1)
  lower = 1
  0.upto(arr.size - 1) do |i|
    products[i] = products[i] * lower
    lower = lower * arr[i]
  end
  upper = 1
  (arr.size - 1).downto(0) do |i|
    products[i] = products[i] * upper
    upper = upper * arr[i]
  end

  products
end

# Write a function that takes an array and returns all of its subsets.
def subsets(array)
  return [[]] if array.empty?
  first_el = array[0]
  previous = subsets(array[1..-1])
  added = previous.map { |el| el + [first_el] }
  previous.concat(added)
end

# Return the indices of the start/end of the longest palindrome in the string.
# You could reverse the string and compare it to the original, but that is slow.
# Instead, you should be able to solve the problem with O(1) memory.
def longest_palindrome(string)
  best_palindrome_start = 0
  best_palindrome_len = 0

  0.upto(string.length - 1).each do |start|
    # micro-optimization: don't look at substrings shorter than best
    # palindrome.
    len = best_palindrome_len + 1
    while start + len <= string.length
      if is_palindrome?(string, start, len)
        best_palindrome_start, best_palindrome_len = start, len
      end

      len += 1
    end
  end

  [best_palindrome_start, best_palindrome_start + best_palindrome_len - 1]
end

def is_palindrome?(string, start, len)
  len.times do |i|
    if string[start + i] != string[(start + len - 1) - i]
      return false
    end
  end

  true
end

# Given two arrays, find the intersection of both sets.
# It should be trivial to write an O(n**2) solution.
# Use sorting to solve in O(nlog(n)).
# Next, improve this to O(n) time (maybe use a non-array datastructure).
def fast_intersection(array_one, array_two)
  intersection = []
  set1 = array_one.to_set
  array_two.each do |el|
    intersection << el if set1[el]
  end
  intersection
end

# Write a function that takes two arrays of integers
# Returns an array with all the subsets commmon to both arrays.
# Don't generate all subsets of both arrays, which would be exponential time.
# Instead, directly generate the subsets of both.
def common_subsets(array_one, array_two)
  subsets(intersection(array_one, array_two))
end

# You are given an array and index.
# Find if it's possible to reach 0 by starting at the index.
# You can only move left or right by the distance found at array[index].
def can_win?(array, index=0, seen={})

end

# Assume an array of length n, containing the numbers 1..n in jumbled order.
# "Sort" this array in O(n) time.
# Hint: You should be able to do this without looking at the input.
def sort1(array)
  (1...array.length).to_a
end

# Assume an array of length n with numbers in the range 1..N (N >= n).
# Sort this array in O(n + N) time.
# You may use O(N) memory.
def sort2(array, max_value)
  count = Hash.new(0)
  result = []
  array.each{ |el| count[el] += 1}
  count.each do |el, ct|
    ct.times{ result << el }
  end
  result
end

# Say I give you an array of n strings, each of length k.
# Merge sort can sort this in O(knlog(n)).
# Sort the strings in O(kn).
# Hint: Do not compare any two strings.
# All strings contain only lowercase letters without whitespace or punctuation.
def sort3(strings, length)
  (length-1).down_to(0) do |i|
    buckets = Array.new(26){[]}
    strings.each do |string|
      letter = string[i]
      buckets[letter.ord - "a".ord] << string
    end
  end

  result = []
  buckets.each do |bucket|
    bucket.each { |string| result << string }
  end

  result
end

# Given an array, write a function that will return a random index of the array.
# The chance of returning a given index will vary with the value of the element.
# Probability of i should be the ith element divided by the sum of all elements.
#[1,2,3]
#indices = 0, 1, 2
#probabilities = [1/6, 2/6, 3/6]
#[0, 1, 1, 2, 2, 2]
def weighted_random_index(array)
  total = array.inject(:+)
  result = []
  array.each_with_index do |el, i|
    el.times{result << i}
  end

  rand_num = Random.new
  rand_ind = rand_num.rand(total-1)
  result[rand_ind]
end

def weighted_random_index2(array)
  total = array.inject(:+)
  value = rand(total)
  cumulative_total = 0
  array.each_with_index do |el|
    cumulative_total += el
    return i if value < cumulative_total
  end
end

# Given an array, move all zeros to the end.
# The order of non-zero elements does not matter.
# Try to accomplish this in O(n) time and O(1) space.
def move_zeros(array)
end

# Implement the 'look and say' function.
#'Look and say' takes an input array and outputs an array.
# The output describes the count of the elements in the input.

def look_and_say(array)
  return [] if array.empty?
  output = [[1, array[0]]]

  (1...array.length).each do |idx|
    el = array[idx]
    if el == output.last[1]
      output.last[0] +=1
    else
      output << [1, el]
    end
  end

  output
end

# I give you a scrambled list of n unique integers between 0 and n.
# Tell me what number is missing?
# How could you solve the problem in O(n), and also O(1) space?
def sum_upon_sums(array)
  array_sum = array.inject(:+)
  total = (0..n).to_a.inject(:+)
  total - array_sum
end

# Implement a stack with a max method that returns the maximum value.
# It should run in O(1) time.
class MaxStack

end

# Implement a queue using stacks.
# That is, write enqueue and dequeue using only push and pop operations.
# In terms of performance, enqueue should be O(1).
# Dequeue may be worst-case O(n).
# In terms of ammortized time, dequeue should be O(1).
# Prove that your solution accomplishes this.
class StackQueue

end

# Take an array, and a window size w.
# Find the maximum max - min within a range of w elements.
# First solve MaxStack.
# Write a MinMaxStack to track both the min and the max in a stack.
# Next, solve StackQueue.
# Write a MinMaxStackQueue which tracks both the min and max.
# Last, use MinMaxStackQueue to solve the problem.
class MinMaxStack

end

class MinMaxStackQueue

end

def windowed_max_range(array, w)

end

# Suppose a hash representing a directory.
# All keys are strings with names for either folders or files.
# Keys that are folders point to nested hashes.
# Keys that are files point to "true".
# Write a function that takes such a hash.
# Return an array of strings with the path to each file in the hash.
def file_list(hash)

end

# Assume an array of non-negative integers.
# A second array is made by shuffling the first and deleting a random element.
# Given these two arrays, find which element is missing in the second array.
# Do this in linear time with constant memory use.
def find_missing_number(array_one, array_two)

end

# Create a function that takes three strings.
# Return whether the third is an interleaving of the first two.
# Interleaving means it contains the same characters and preserves their order.
def is_shuffle?(string_one, string_two, string_three)

end

# Write a function that takes an integer and returns it in binary form.
def binary(integer)

end

# Write a recursive function that takes a number and returns its factorial.
def recursive_factorial(number)

end

# Write an iterative function that takes a number and returns its factorial.
def iterative_factorial(number)

end

# Write a method that takes an array and returns all its permutations.
def permutations(array)

end


##Binary Tree
class BSTNode
  attr_reader :value, :left, :right, :parent
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def left=(left)
    @left = left
  end

  def right=(right)
    @right = right
  end

end


def in_order_traversal(node, arr=[])
  return arr if !node
  left, right = node.left, node.right
  return in_order_traversal(left) + arr[node.value] + in_order_traversal(right)
end

def dfs(node, target)
  return nil if !node
  return node if node.value == target
  left, right = dfs(node.left, target), dfs(node.right, target)
  return left if left
  return right if right
  return nil
end

def bfs(node, target)
  return nil if !node

  queue = []
  queue.push(node)
  until queue.empty?
    current_node = queue[0]
    if current_node.value == target
      return current_node
    end
    queue.push(current_node.left) if current_node.left
    queue.push(current_Node.right) if current_node.right
    queue.shift(current_node)
  end
  nil
end

def is_bst?(node)
  arr = in_order_traversal(node)
  is_sorted(arr)
end

def is_sorted(arr)
  return true if arr.length < 2
  if arr[-1] > arr[-2]
    return is_sorted(arr[0...-1])
  end
  return false
end



# path = []
# n1 = BSTNode.new(5)
# n2 = BSTNode.new(3)
# n3 = BSTNode.new(2)
# n4 = BSTNode.new(4)
# n5 = BSTNode.new(6)
# n6 = BSTNode.new(1)
# n1.left = n2
# n1.right = n5
# n2.left = n3
# n2.right = n4
# n4.left = n6
# def show_node_values(arr)
#   arr.map { |e| e.value  }
# end

def lowest_common_ancestor(node1, node2, head)
  path1, path2 = [], []
  find_path(head, node1.value, path1)
  find_path(head, node2.value, path2)
  path1.each do |el|
    return el.value if path2.include?(el)
  end
  return nil
end

def find_path(node, target, path)
  return false if !node
  return true if node.value == target

  if(node.left && find_path(node.left, target, path))
    path.push(node)
    return true
  end
  if(node.right && find_path(node.right, target ,path))
    path.push(node)
    return true
  end

  return false
end
## Study Plan

def bfs(node, target)
  queue = []
  queue.push(node)
  until queue.empty?
    current = queue.unshift()
    if node.value == target
      return current
    end
    queue.push(current.left) if current.left
    queue.push(current.right ) if current.right
  end
  return nil
end
#dfs with stack
def dfs(node, target)
  stack = []
  stack.push(node)
  until stack.empty?
    current = stack.pop()
    if current.value == target
      return current
    end
    stack.push(current.right) if current.right
    stack.push(current.left) if current.left
  end
end
#dfs with recursion
def dfs2(node, target)
  return nil if !node
  #dfs(node.left) - return node or nil
  #dfs(node.right) - return node or nil
  if node.value == target
    return node
  end
  left = dfs(node.left)
  right = dfs(node.right)
  if left
    return left
  elsif right
    return right
  else
    return nil
  end

end

def in_order_traversal(root, values = [])
  return values if !root
  left, right = root.left, root.right
  return in_order_traversal(left) + [root] + in_order_traversal(right)
end

def lca(node1, node2, root)
  path1, path2 = [], []
  find_path(root, node1.value, path1)
  find_path(root, node2.value, path2)
  path1.each do |el|
    return el if path2.include?(el.value)
  end

  return nil
end

def find_path(node, target, path)
  return false if !root
  return true of node.value == target
  if(node.left && find_path(node.left, target, path))
    path.push(node.left)
  end
  if (node.right && find_path(node.right, target, path))
    path.push(node.right)
  end
  return false
end

def merge_sort(arr)
  return arr if arr.length < 2
  middle = arr.length/2
  left, right = arr[0...middle], arr[middle...arr.length]
  sorted_left, sorted_right = merge_sort(left), merge_sort(right)
  return merge(sorted_left, sorted_right)
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if(left[0] <= right[0])
      sorted.push(left.shift())
    else
      sorted.push(right.shift())
    end
  end
  return left + sorted + right
end

def quick_sort(arr)
  return arr if arr.length < 2
  left, right = [], []
  pivot = arr[0]
  arr[1...arr.length].each do |el|
    if el <= pivot
      left.push(el)
    else
      right.push(el)
    end
  end

  sorted_left, sorted_right = quick_sort(left), quick_sort(right)
  return sorted_left + [pivot] + sorted_right
end

def binary_search(arr, target)
  return nil if arr.count == 0
  midpoint = arr.length/2
  case target <=>  arr[midpoint]
    when -1
      binary_search(arr.take(midpoint), target)
    when 0
      return midpoint
    when 1
      ans = binary_search(arr.drop(midpoint + 1), target)
      ans.nil? ? nil : (ans + midpoint + 1)
  end
end

def has_cycle?(node)
  count = Hash.new(0)
  current = node
  until !current
    count[current] +=1
    return true if count[current] > 1
  end

  return false
end

def median(arr)
  return nil if !arr.count
  
end



#trees/stacks/queues: bfs/dfs/in_order_traversal/lca - done
#searches:  merge_sort, quick_sort, binary_search    - done
#linked lists: detect a cycle in a linked List
# heaps: find the median of a list of numbers
# hash tables:
