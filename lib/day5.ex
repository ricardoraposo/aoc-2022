defmodule Day5 do
  @input Aoc.read_file("input/day5_input.txt")

  defp get_map do
    matrix =
      @input
      |> Enum.slice(0..7)
      |> Enum.map(fn line ->
        for index <- 0..8, do: String.at(line, index * 4 + 1)
      end)

    Enum.map(1..length(hd(matrix)), fn col ->
      Enum.map(matrix, &Enum.at(&1, col - 1))
      |> Enum.filter(&(&1 != " "))
    end)
  end

  defp get_instructions do
    @input
    |> Enum.slice(10..-1//1)
    |> Aoc.remove_last()
    |> Enum.map(fn line ->
      String.split(line, " ")
      |> Enum.filter(fn x -> x != "move" && x != "from" && x != "to" end)
      |> Enum.map(&String.to_integer/1)
    end)
  end

  def part1 do
    map = get_map()
    instructions = get_instructions()

    instructions
    |> Enum.reduce(map, fn [qnt, from, to], map ->
      from_value = Enum.at(map, from - 1) |> Enum.take(qnt) |> Enum.reverse()
      from_col = Enum.at(map, from - 1) |> Enum.drop(qnt)
      new_col = from_value ++ Enum.at(map, to - 1)

      List.replace_at(map, from - 1, from_col)
      |> List.replace_at(to - 1, new_col)
    end)
    |> Enum.reduce("", fn col, acc -> acc <> Enum.at(col, 0) end)
  end

  def part2 do
    map = get_map()
    instructions = get_instructions()

    instructions
    |> Enum.reduce(map, fn [qnt, from, to], map ->
      from_value = Enum.at(map, from - 1) |> Enum.take(qnt)
      from_col = Enum.at(map, from - 1) |> Enum.drop(qnt)
      new_col = from_value ++ Enum.at(map, to - 1)

      List.replace_at(map, from - 1, from_col)
      |> List.replace_at(to - 1, new_col)
    end)
    |> Enum.reduce("", fn col, acc -> acc <> Enum.at(col, 0) end)
  end

  def run do
    IO.puts("Day 5")
    IO.puts("Part 1: " <> part1())
    IO.puts("Part 2: " <> part2())
    IO.puts("============================")
  end
end
