defmodule Monet.CLI do
  def main(args \\ []) do
    args
    |> parse_args()
    |> execute()
  end

  defp parse_args(args) do
    {opts, _, _} =
      args
      |> OptionParser.parse(strict: [host: :string, cookie: :string])
    opts
  end

  defp execute(opts) do
    IO.inspect opts[:cookie]
    # set the node name and cookie
    Monet.SimpleQueue.enqueue(20)
    IO.inspect Monet.SimpleQueue.queue
    IO.inspect Monet.SimpleQueue.dequeue
    IO.inspect Monet.SimpleQueue.queue
  end
end

# reference for setting nodenames: https://stackoverflow.com/questions/41269876/elixir-set-cookie-and-hostname-for-release-created-using-mix-escript-build
# reference for no halting: https://stackoverflow.com/questions/30073563/how-can-i-build-an-elixir-escript-that-does-not-halt-the-erlang-vm-after-executi
# https://elixirforum.com/t/basic-missing-a-fundamental-concept-with-applications-appreciate-help-mix-run-not-waiting/12635/12
