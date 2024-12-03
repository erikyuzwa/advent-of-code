# part 2
 
inputfile = "input2.txt"
accumulator = 0
match_count = 0

content = File.read(inputfile)

operation_re = /mul\(\d+,\d+\)/

matches = content.scan(operation_re)
matches.each do |match|
  # puts "#{match}"

  operand_matches = match.scan(/\d+/)
  # puts "#{operand_matches}"
  result = operand_matches[0].to_i * operand_matches[1].to_i

  accumulator += result
end

puts "processed #{matches.count} matches."
puts "computed result: #{accumulator}"

#
