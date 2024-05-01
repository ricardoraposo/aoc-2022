defmodule Aoc do
  def start(_type, _args) do
    Aoc.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    Day2.run()
  end
end
