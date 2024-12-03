# part 2

def is_digit?(s)
  code = s.ord
  # 48 is ASCII code of 0
  # 57 is ASCII code of 9
  48 <= code && code <= 57
end

inputfile = "input.txt"
accumulator = 0
match_count = 0
mul_enabled = true # variable to track do() or don't()

content = File.read(inputfile)

# brute force character by character
index = 0
puts "mul_enabled = true"
while (index != content.length)
  char = content[index]
  puts "#{content[index]}"

  if char.downcase == 'd' then
    if content[index + 1] == 'o' then
      if content[index + 2] == '(' then
        if content[index + 3] == ')' then
          index += 3
          mul_enabled = true
          puts "mul_enabled = true"
        end
      end
    end
  end

  if char.downcase == 'd' then
    if content[index + 1] == 'o' then
      if content[index + 2] == 'n' then
        if content[index + 3] == '\'' then
          if content[index + 4] == 't' then
            if content[index + 5] == '(' then
              if content[index + 6] == ')' then
                index += 6
                mul_enabled = false
                puts "mul_enabled = false"
              end
            end
          end
        end
      end
    end
  end

  if char.downcase == 'm' then
    if content[index + 1].downcase == 'u' then
      if content[index + 2].downcase == 'l' then
        if content[index + 3] == '(' then
          index += 4
          op1_s = ""
          op2_s = ""

          while (content[index] != ',' && is_digit?(content[index]))
            op1_s += content[index]
            index += 1
          end

          # handle the ','
          index += 1

          while (content[index] != ')' && is_digit?(content[index]))
            op2_s += content[index]
            index += 1
          end

          #require 'byebug'; byebug
          if content[index] == ')' then
            puts "mul: (#{op1_s}, #{op2_s})"
  
            match_count += 1
            accumulator += op1_s.to_i * op2_s.to_i if mul_enabled
          end
        end
      end
    end
  end
          
  index += 1
end

puts "processed #{match_count} matches."
puts "computed result: #{accumulator}"

# 717 matches
# computed result: 127092535

