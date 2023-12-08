# frozen_string_literal: true

def part_one(data)
  instructions = data.first.split('')
  directions = {}

  data = data[2..]
  data.each do |line|
    name, left, right = line.match(/(\w+)\s*=\s*\((\w+),\s*(\w+)\)/)&.captures
    directions[name] = [left, right]
  end

  cursor = 'AAA'
  steps = 0
  while cursor != 'ZZZ'
    l = instructions[steps % instructions.length].eql?('L') ? 0 : 1
    cursor = directions[cursor][l]
    steps += 1
  end

  steps
end

def part_two(data)
  instructions = data.first.split('')
  directions = {}

  data = data[2..]
  data.each do |line|
    name, left, right = line.match(/(\w+)\s*=\s*\((\w+),\s*(\w+)\)/)&.captures
    directions[name] = [left, right]
  end

  cursors = []
  directions.each_key do |key|
    cursors << key if key.end_with? 'A'
  end

  steps = 0
  destinations = {}
  while destinations.length != cursors.length

    cursors.each_with_index do |cursor, index|
      l = instructions[steps % instructions.length].eql?('L') ? 0 : 1
      cursors[index] = directions[cursor][l]
    end

    steps += 1
    cursors.each_with_index do |cursor, index|
      destinations[index] = steps if cursor.end_with? 'Z'
    end
  end

  destinations.values.inject(&:lcm)
end

def test_part_one
  input = File.read('ex1.txt').split("\n")
  ans = part_one input
  puts ans
  raise 'part one wrong' unless ans == 2
end

def test_part_two
  input = File.read('ex2.txt').split("\n")
  ans = part_two input
  puts ans
  raise 'part two wrong' unless ans == 6
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
