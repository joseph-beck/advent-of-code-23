# frozen_string_literal: true

def part_one(data)
  points_sum = 0

  data.each do |line|
    # i had a thing that did the same thing but gave a different answer i dont even know at this point
    _, winners, cards = line.match(/^Card\s+(\d+):\s+(.*?)\s+\|\s+(.*)\z/)&.captures
    cards = cards.split.map(&:to_i).to_set
    points = winners.split.map(&:to_i).reduce(0) do |p, number|
      cards.include?(number) ? (p.positive? ? p * 2 : 1) : p
    end

    points_sum += points
  end

  points_sum
end

def part_two(data)
  counts, count_sum = Array.new(data.length + 1, 0), 0

  data.each_with_index do |line, i|
    # i had a thing that did the same thing but gave a different answer i dont even know at this point
    _, winners, cards = line.match(/^Card\s+(\d+):\s+(.*?)\s+\|\s+(.*)\z/)&.captures
    count, winners_count, cards = (counts[i + 1] += 1), 0, cards.split.map(&:to_i).to_set
    count_sum += count

    winners.split.map(&:to_i).reduce(0) do |_, number|
      if cards.include? number
        winners_count += 1
        counts[i + 1 + winners_count] += count
      end
    end
  end

  count_sum
end

def test_part_one
  input = File.read('ex1.txt').split("\n")
  ans = part_one input
  puts ans
  raise 'part one wrong' unless ans == 13
end

def test_part_two
  input = File.read('ex1.txt').split("\n")
  ans = part_two input
  puts ans
  raise 'part two wrong' unless ans == 30
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
