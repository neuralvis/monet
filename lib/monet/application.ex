defmodule Monet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Monet.Worker.start_link(arg)
      # {Monet.Worker, arg}
      # {Monet.SimpleQueue, [1, 2, 3]},
      {Monet.Ping, 10},
      {Task.Supervisor, name: Monet.TaskSupervisor }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Monet.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
