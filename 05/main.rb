# frozen_string_literal: true

def part_one(data)
  0
end

def part_two(data)
  0
end

def test_part_one
  input = File.read('ex1.txt').split("\n")
  ans = part_one input
  puts ans
  raise 'part one wrong' unless ans == 0
end

def test_part_two
  input = File.read('ex1.txt').split("\n")
  ans = part_two input
  puts ans
  raise 'part two wrong' unless ans == 0
end

if __FILE__ == $PROGRAM_NAME
  file_data = File.read('in.txt').split("\n")

  puts '===== PART ONE ====='

  puts part_one file_data
  test_part_one

  puts '===== PART TWO ====='

  puts part_two file_data
  test_part_two
end
