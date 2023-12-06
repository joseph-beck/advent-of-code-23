# frozen_string_literal: true

SMALL_NUM = 0.000001

def part_one(data)
  times = data.first.gsub('Time: ', '').split.map(&:to_i)
  distances = data.last.gsub('Distance: ', '').split.map(&:to_i)
  results = []

  times.each_with_index do |time, i|
    d = distances[i]
    one, two = ((-time - Math.sqrt(time**2 - 4 * d)) / -2 - SMALL_NUM).floor, ((-time + Math.sqrt(time**2 - 4 * d)) / -2 + SMALL_NUM).ceil
    results << one - two + 1
  end

  results.reject(&:zero?).inject(:*)
end

def part_two(data)
  times = [data.first.gsub('Time: ', '').split.join.to_i]
  distances = [data.last.gsub('Distance: ', '').split.join.to_i]

  results = []

  times.each_with_index do |time, i|
    d = distances[i]
    one, two = ((-time - Math.sqrt(time**2 - 4 * d)) / -2 - SMALL_NUM).floor, ((-time + Math.sqrt(time**2 - 4 * d)) / -2 + SMALL_NUM).ceil
    results << one - two + 1
  end

  results.reject(&:zero?).inject(:*)
end

def test_part_one
  input = File.read('ex1.txt').split("\n")
  ans = part_one input
  puts ans
  raise 'part one wrong' unless ans == 288
end

def test_part_two
  input = File.read('ex1.txt').split("\n")
  ans = part_two input
  puts ans
  raise 'part two wrong' unless ans == 71_503
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
