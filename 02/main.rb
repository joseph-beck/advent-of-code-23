# frozen_string_literal: true

def part_one(data)
  0
end

def part_two(data)
  0
end

def test_part_one
  input = %w[]
  ans = part_one input
  raise 'part one wrong' unless ans == 0
end

def test_part_two
  input = %w[]
  ans = part_two input
  raise 'part two wrong' unless ans == 0
end

if __FILE__ == $PROGRAM_NAME
  file_data = File.read('in.txt').split("\n")

  puts part_one file_data
  test_part_one

  puts part_two file_data
  test_part_two
end
