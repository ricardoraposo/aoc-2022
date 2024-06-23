defmodule Day7 do
  @input """
  $ cd /
  $ ls
  dir a
  14848514 b.txt
  8504156 c.dat
  dir d
  $ cd a
  $ ls
  dir e
  29116 f
  2557 g
  62596 h.lst
  $ cd e
  $ ls
  584 i
  $ cd ..
  $ cd ..
  $ cd d
  $ ls
  4060174 j
  8033020 d.log
  5626152 d.ext
  7214296 k
  """

  def parse_lines(line) do
    [head | tail] = line

    case head do
      "$" -> IO.puts("Command: #{tail}")
      _ -> IO.puts("File: #{head}")
    end
  end

  def part1 do
    _ =
      @input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, " "))

    # |> Enum.map(&parse_lines/1)

    :I_quit
  end

  def run do
    IO.puts("Day 7")
    IO.inspect(part1())
    IO.puts("============================")
  end
end
