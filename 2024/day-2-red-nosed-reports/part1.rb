# part 1
# - load the input
# sort the input which is in column format
# 
inputfile = "input.txt"
line_count = 0
safe_count = 0


def ascending?(array)
  array.each_cons(2).all? { |a, b| a <= b }
end

def descending?(array)
  array.each_cons(2).all? { |a, b| a >= b }
end

File.foreach(inputfile) do |line|
  # parse out the line
  parsed = line.split(" ").map(&:to_i)
  safe = []

  puts "#{parsed}"

  asc_check = ascending?(parsed)
  desc_check = descending?(parsed)

  # puts "asc_check - #{asc_check}"
  # puts "desc_check - #{desc_check}"

  # if both checks fail then it is not safe
  if asc_check == false && desc_check == false then
    puts "#{parsed.inspect}: unsafe"
    next
  else
    parsed.each_with_index do |entry, index|
      if parsed[index + 1] then
        diff = (entry - parsed[index + 1]).abs
        if diff >= 1 && diff <= 3 then
          safe << true
        else
          safe << false
        end
      end
    end

    if !safe.include? false then
      safe_count += 1
      puts "#{safe.inspect}: safe"
    else
      puts "#{safe.inspect}: unsafe"
    end

  end

  #require 'byebug'; byebug
  line_count += 1

end

puts "processed #{line_count} lines."
puts "safe count: #{safe_count}."

# 479 is the answer with the given input
#