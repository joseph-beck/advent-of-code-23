# frozen_string_literal: true

def part_one(data)
  result = 0
  data.each do |line|
    first, last = '', ''
    line.split('').each do |char|
      first = char if char.match?(/[[:digit:]]/) && first == ''
      last = char if char.match?(/[[:digit:]]/)
    end

    result += (first.to_s + last.to_s).to_i
  end

  result
end

def part_two(data)
  numbers = %w[one two three four five six seven eight nin]
  result = 0

  data.each do |line|
    first, last = '', ''
    for i in 0..line.length do
      numbers.each_with_index do |num, j|
        first = j + 1 if (line[i..].start_with? num) && first == ''
        last = j + 1 if line[i..].start_with? num
      end

      char = line[i].to_s
      first = char if char.match?(/[[:digit:]]/) && first == ''
      last = char if char.match?(/[[:digit:]]/)
    end

    result += (first.to_s + last.to_s).to_i
  end

  result
end

def test_part_one
  input = %w[1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet]
  ans = part_one input
  raise 'part one wrong' unless ans == 142
end

def test_part_two
  input = %w[two1nine eightwothree abcone2threexyz xtwone3four 4nineeightseven2 zoneight234 7pqrstsixteen]
  ans = part_two input
  raise 'part two wrong' unless ans == 281
end

if __FILE__ == $PROGRAM_NAME
  file_data = File.read('in.txt').split("\n")

  puts part_one file_data
  test_part_one

  puts part_two file_data
  test_part_two
end
