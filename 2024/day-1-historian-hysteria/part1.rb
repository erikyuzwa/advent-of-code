# part 1
# - load the input
# sort the input which is in column format
# 
inputfile = "input.txt"
left_list = []
right_list = []
distance_list = []

File.foreach(inputfile) do |line| 
  parsed = line.split(" ")
  left_list << parsed[0].to_i
  right_list << parsed[1].to_i
end

left_list.sort!
right_list.sort!

# assuming that the count of the two lists are the same
# if left_list.count != right_list.count -- then bail?

puts "sorted lists counts - #{left_list.count == right_list.count}"

left_list.each_with_index do |left_input, i|
  diff = (left_input - right_list[i]).abs
  distance_list << diff
end

# the total answer for part 1 is the sum of all the array entries
puts distance_list.sum

# answer: 1580061 (with given input)
