defmodule Day1 do
  def read_file(path) do
    case File.read(path) do
      {:ok, content} -> content
      {:error, reason} -> raise reason
    end
    |> String.split("\n")
  end

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
    read_file("input/day1_input.txt")
    |> calculate_sums()
    |> Enum.max()
    |> IO.inspect()
  end

  def part2 do
    [first, second, third | _] =
      read_file("input/day1_input.txt")
      |> calculate_sums
      |> Enum.sort(&>/2)

    IO.inspect(first + second + third)
  end

  def run do
    part1()
    part2()
  end
end
