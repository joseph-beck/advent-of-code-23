# frozen_string_literal: true

def part_one(data)
  histories = []

  do_next = lambda do |history|
    return 0 if history.all?(&:zero?)

    history.last + do_next.call(history.each_cons(2).to_a.map { |a, b| b - a })
  end

  data.each do |line|
    histories << line.split.map(&:to_i)
  end

  report = []
  histories.each do |history|
    report << do_next.call(history)
  end

  report.sum
end

def part_two(data)
  histories = []

  do_next = lambda do |history|
    return 0 if history.all?(&:zero?)

    history.first - do_next.call(history.each_cons(2).to_a.map { |a, b| b - a })
  end

  data.each do |line|
    histories << line.split.map(&:to_i)
  end

  report = []
  histories.each do |history|
    report << do_next.call(history)
  end

  report.sum
end

def test_part_one
  input = File.read('ex1.txt').split("\n")
  ans = part_one input
  puts ans
  raise 'part one wrong' unless ans == 114
end

def test_part_two
  input = File.read('ex1.txt').split("\n")
  ans = part_two input
  puts ans
  raise 'part two wrong' unless ans == 2
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
