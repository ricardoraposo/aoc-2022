defmodule Day3 do
  require Integer

  @input Aoc.read_file("input/day3_input.txt")
  @alphabet String.split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", "")

  def get_position(char) do
    Enum.find_index(@alphabet, fn item -> item == char end)
  end

  def remove_last([_]), do: []
  def remove_last([head | tail]), do: [head | remove_last(tail)]
  def remove_last([]), do: []

  defp part1 do
    @input
    |> Enum.reduce(0, fn line, common ->
      {first, second} =
        line
        |> String.trim()
        |> String.split_at(div(String.length(line), 2))

      first = String.graphemes(first)
      second = String.graphemes(second)

      common +
        (Enum.filter(first, fn item -> Enum.member?(second, item) end)
         |> Enum.uniq()
         |> Enum.max()
         |> get_position())
    end)
  end

  defp part2 do
    @input
    |> remove_last()
    |> Enum.chunk_every(3)
    |> Enum.reduce(0, fn [line1, line2, line3], common ->
      line1 = String.graphemes(line1)
      line2 = String.graphemes(line2)
      line3 = String.graphemes(line3)

      common +
        (Enum.filter(line1, fn item -> Enum.member?(line2, item) end)
         |> Enum.filter(fn item -> Enum.member?(line3, item) end)
         |> Enum.uniq()
         |> Enum.max()
         |> get_position())
    end)
  end

  def run do
    IO.puts("Day 3")
    IO.puts("Part 1: " <> Integer.to_string(part1()))
    IO.puts("Part 2: " <> Integer.to_string(part2()))
    IO.puts("============================")
  end
end
