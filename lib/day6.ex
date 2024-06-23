defmodule Day6 do
  @input (case(File.read("input/day6_input.txt")) do
            {:ok, content} -> content
            {:error, reason} -> raise reason
          end)
         |> String.split("")

  def check(list, index, size) do
    len = list |> Enum.slice(0..(size - 1)) |> Enum.uniq() |> length()

    cond do
      len == size -> index
      len < size -> check(tl(list), index + 1, size)
    end
  end

  def part1 do
    input = @input |> Enum.slice(1..-1//1)

    check(input, 4, 4)
  end

  def part2 do
    input = @input |> Enum.slice(1..-1//1)

    check(input, 14, 14)
  end

  def run do
    IO.puts("Day 6")
    IO.puts("Part 1: " <> (part1() |> Integer.to_string()))
    IO.puts("Part 2: " <> (part2() |> Integer.to_string()))
    IO.puts("============================")
  end
end
