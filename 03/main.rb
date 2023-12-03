# frozen_string_literal: true

def pad(data)
  data.unshift '.' * data[0].length
  data << '.' * data[0].length

  data.each_with_index do |line, index|
    data[index] = ".#{line}."
  end
end


def part_one(data)
  data, parts = pad(data), []

  symbol_adjacent = lambda do |input, row, column, column_end|
    for i in row - 1..row + 1
      for j in column - 1..column_end + 1
        return true if /[^0-9.]/.match? input[i][j]
      end
    end

    false
  end

  for i in 1..data.length - 1 do
    j = 1
    while j < data[i].length - 1
      if data[i][j].match?(/[[:digit:]]/)
        k, num_str = j, data[i][j]

        while data[i][k + 1].match?(/[[:digit:]]/)
          k += 1
          num_str += data[i][k]
        end

        parts << num_str.to_i if symbol_adjacent.call(data, i, j, k)
        j = k
      end

      j += 1
    end
  end

  parts.sum
end

def part_two(data)
  data, ratios = pad(data), []

  calc_ratio = lambda do |input, row, column|
    numbers, visited, result = [], [], []

    for i in row - 1..row + 1
      for j in column - 1..column + 1
        numbers << [i, j] if /[[:digit:]]/.match?(input[i][j])
      end
    end

    numbers.each do |pos|
      next if visited.include? pos

      visited << pos
      number = input[pos[0]][pos[1]]

      l, r = pos[1] - 1, pos[1] + 1
      while /[[:digit:]]/.match?(input[pos[0]][l]) && !visited.include?([pos[0], l])
        number = input[pos[0]][l] + number
        visited << [pos[0], l]
        l -= 1
      end

      while /[[:digit:]]/.match?(input[pos[0]][r]) && !visited.include?([pos[0], r])
        number += input[pos[0]][r]
        visited << [pos[0], r]
        r += 1
      end

      result << number.to_i
    end

    result.delete(0)
    return result[0] * result[1] if result.length >= 2

    0
  end

  for i in 1..data.length - 1 do
    for j in 1..data.length - 1 do
      ratios << calc_ratio.call(data, i, j) if data[i][j].eql? '*'
    end
  end

  ratios.sum
end

def test_part_one
  input = File.read('ex1.txt').split("\n")
  ans = part_one input
  puts ans
  raise 'part one wrong' unless ans == 4361
end

def test_part_two
  input = File.read('ex1.txt').split("\n")
  ans = part_two input
  puts ans
  raise 'part two wrong' unless ans == 467_835
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
