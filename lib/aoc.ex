defmodule Aoc do
  def start(_type, _args) do
    Aoc.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def read_file(path) do
    case File.read(path) do
      {:ok, content} -> content
      {:error, reason} -> raise reason
    end
    |> String.split("\n")
  end

  def remove_last([_]), do: []
  def remove_last([head | tail]), do: [head | remove_last(tail)]
  def remove_last([]), do: []

  def main do
    Day1.run()
    Day2.run()
    Day3.run()
    Day4.run()
  end
end
