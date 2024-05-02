defmodule Day4 do
  @buff Aoc.read_file("input/day4_input.txt")

  def part1 do
    @buff
    |> Aoc.remove_last()
    |> Enum.reduce(0, fn line, acc ->
      [first, second] = String.split(line, ",")

      [a, b] = String.split(first, "-") |> Enum.map(&String.to_integer/1)
      [c, d] = String.split(second, "-") |> Enum.map(&String.to_integer/1)

      cond do
        a <= c && b >= d -> acc + 1
        c <= a && d >= b -> acc + 1
        true -> acc
      end
    end)
  end

  def part2 do
    @buff
    |> Aoc.remove_last()
    |> Enum.reduce(0, fn line, acc ->
      [first, second] = String.split(line, ",")

      [a, b] = String.split(first, "-") |> Enum.map(&String.to_integer/1)
      [c, d] = String.split(second, "-") |> Enum.map(&String.to_integer/1)

      cond do
        a <= c && b >= c -> acc + 1
        c <= a && d >= a -> acc + 1
        b >= d && a <= d -> acc + 1
        d >= b && c <= b -> acc + 1
        true -> acc
      end
    end)
  end

  def run do
    IO.puts("Day 4")
    IO.puts("Part 1: " <> Integer.to_string(part1()))
    IO.puts("Part 2: " <> Integer.to_string(part2()))
    IO.puts("============================")
  end
end
