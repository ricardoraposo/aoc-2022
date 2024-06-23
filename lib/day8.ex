defmodule Day8 do
  @input """
  30373
  25512
  65332
  33549
  35390
  """

  def parse_input(input) when is_binary(input) do
    input =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, "", trim: true))

    Enum.map(input, fn line ->
      Enum.map(line, fn char ->
        String.to_integer(char)
      end)
    end)
  end

  def part1 do
    parse_input(@input)
  end

  def run do
    IO.inspect(part1())
  end
end
