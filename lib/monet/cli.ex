defmodule Monet.CLI do
  def main(args \\ []) do
    args
    |> parse_args()
    |> execute()
  end

  defp parse_args(args) do
    {opts, _, _} =
      args
      |> OptionParser.parse(strict: [host: :string])
    opts
  end

  defp execute(opts) do
    IO.puts opts[:host]
    Monet.SimpleQueue.enqueue(20)
    IO.inspect Monet.SimpleQueue.queue
    IO.inspect Monet.SimpleQueue.dequeue
    IO.inspect Monet.SimpleQueue.queue
  end
 
end
