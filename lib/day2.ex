defmodule Day2 do
  @points_map %{
    win: 6,
    draw: 3,
    loss: 0
  }

  @play_map %{
    rock: 1,
    paper: 2,
    scissors: 3
  }

  @buff Day1.read_file("input/day2_input.txt")

  def part1 do
    @buff
    |> Enum.reduce(0, fn line, points ->
      play = String.split(line, " ")

      case play do
        ["A", "X"] -> points + @play_map.rock + @points_map.draw
        ["A", "Y"] -> points + @play_map.paper + @points_map.win
        ["A", "Z"] -> points + @play_map.scissors + @points_map.loss
        ["B", "X"] -> points + @play_map.rock + @points_map.loss
        ["B", "Y"] -> points + @play_map.paper + @points_map.draw
        ["B", "Z"] -> points + @play_map.scissors + @points_map.win
        ["C", "X"] -> points + @play_map.rock + @points_map.win
        ["C", "Y"] -> points + @play_map.paper + @points_map.loss
        ["C", "Z"] -> points + @play_map.scissors + @points_map.draw
        _ -> points + 0
      end
    end)
  end

  def part2 do
    @buff
    |> Enum.reduce(0, fn line, points ->
      play = String.split(line, " ")

      case play do
        ["A", "X"] -> points + @play_map.scissors + @points_map.loss
        ["B", "X"] -> points + @play_map.rock + @points_map.loss
        ["C", "X"] -> points + @play_map.paper + @points_map.loss
        ["A", "Y"] -> points + @play_map.rock + @points_map.draw
        ["B", "Y"] -> points + @play_map.paper + @points_map.draw
        ["C", "Y"] -> points + @play_map.scissors + @points_map.draw
        ["A", "Z"] -> points + @play_map.paper + @points_map.win
        ["B", "Z"] -> points + @play_map.scissors + @points_map.win
        ["C", "Z"] -> points + @play_map.rock + @points_map.win
        _ -> points + 0
      end
    end)
  end

  def run do
    IO.puts("part1: " <> Integer.to_string(part1()))
    IO.puts("part2: " <> Integer.to_string(part2()))
  end
end
