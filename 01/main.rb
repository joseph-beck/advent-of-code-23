def part_one(data)
  result = []
  data.each do | line |
    first, last = "", ""
    got_first = false
    line.split("").each do | char |
      if char.match?(/[[:digit:]]/) and not got_first
        first = char
        got_first = true
      end

      last = char if char.match?(/[[:digit:]]/)
    end

    result << (first.to_s + last.to_s).to_i
  end

  return result.sum
end

def part_two(data)
  numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  result = []

  data.each do | line |
    first, last = "", ""
    got_first = false

    for i in 0..line.length do
      numbers.each_with_index do | num, j |
        if line[i..-1].start_with? num and not got_first
          first = j + 1
          got_first = true
        end

        if line[i..-1].start_with? num
          last = j + 1
        end
      end

      char = line[i].to_s

      if char.match?(/[[:digit:]]/) and not got_first
        first = char
        got_first = true
      end

      last = char if char.match?(/[[:digit:]]/)
    end

    result << (first.to_s + last.to_s).to_i

  end

  return result.sum
end

if __FILE__ == $0
  file_data = File.read('in.txt').split("\n")
  puts part_one file_data
  puts part_two file_data
end
