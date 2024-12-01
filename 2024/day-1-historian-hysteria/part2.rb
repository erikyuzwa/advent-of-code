# part 2
# location_ids are different!
# need to find similarity score
inputfile = "input.txt"
left_list = []
right_list = []
score_list = []

File.foreach(inputfile) do |line| 
  parsed = line.split(" ")
  left_list << parsed[0].to_i
  right_list << parsed[1].to_i
end

# brute force a similarity score calc
left_list.each do |left_input|
  matches = right_list.select { |i| i == left_input }
  score_list << (left_input * matches.count)
end

# the total similarity score is the sum of the array
puts score_list.sum

# answer: 23046913 (with given input)
