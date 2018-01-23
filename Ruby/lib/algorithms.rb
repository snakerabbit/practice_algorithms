# Write a method that will sum the digits of a positive integer.
# If it is greater than or equal to 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result.
# The result is called a 'digital root'.
# Do not use string conversion within your method.
def digital_root(number)
  return number if number < 10
  root = digital_root(number/10) + digital_root(number%10)
  if root >=10
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
end

# Write a function that takes two strings.
# Return the longest common substring.
def common_substrings(string_one, string_two)
  matrix = Array.new(string_one.length){Array.new(string_two.length)}
  string_one.each_with_index do |char1, i|
    string_two.each_with_index do |char2, j|

    end
  end
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
end

# Write a method that takes a string as input.
# It should return true if the input is a valid IPv4 address.
# Valid IPs are anything between '0.0.0.0' and '255.255.255.255'.
def valid_ip?(string)
  nums = string.split('.').map{|num| num.to_i}
  nums.all?{|num| num >=0 && num<=255}
end

# Implement the Folding Cipher.
# It folds the alphabet in half and uses the adjacent letter.
# a -> z, b -> y, c -> x, m -> n, etc...
def folding_cipher(string)
  folded = Hash[('a'..'z').zip(('a'..'z').to_a.reverse)]
  string.chars.map { |char| folded[char] }.join('')
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
  return array if array.count < 2

  middle = array.count / 2
  left, right = array.take(middle), array.drop(middle)

  sorted_left, sorted_right = merge_sort(left), merge_sort(right)

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    merged <<
      ((left.first < right.first) ? (left.shift) : (right.shift))
  end

  merged + left + right
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
end

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
  return true if array[index] == 0
  return false if !index.between?(0, array.length-1)
  seen[index] = true
  can_win?(array, index+array[index], seen) || can_win?(array, index-array[index], seen=-098321 )
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
  array.each do |el|
    if el == 0
      array.pop(el)
      array.push(el)
    end
  end
  array
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
