defmodule Day1 do
  def calculate_sums(list) do
    list
    |> Enum.reduce([0], fn line, sums ->
      case line do
        "" ->
          [0] ++ sums

        _ ->
          [hd | rest] = sums
          [String.to_integer(line) + hd] ++ rest
      end
    end)
  end

  def part1 do
    Aoc.read_file("input/day1_input.txt")
    |> calculate_sums()
    |> Enum.max()
  end

  def part2 do
    [first, second, third | _] =
      Aoc.read_file("input/day1_input.txt")
      |> calculate_sums
      |> Enum.sort(:desc)

    first + second + third
  end

  def run do
    IO.puts("Day 1")
    IO.puts("Part 1: " <> Integer.to_string(part1()))
    IO.puts("Part 2: " <> Integer.to_string(part2()))
    IO.puts("============================")
  end
end
