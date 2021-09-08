defmodule Monet.Ping do
  use Task

  def start_link(arg \\ []) do
    Task.start_link(__MODULE__, :run, [arg])
  end

  def run(arg) do
    if Node.self == :"alex@127.0.0.1" do
      send_message(:"kate@127.0.0.1", "Kate, do you copy?")
    end
    IO.puts(Node.self)
  end
  
  
  def receive_message(message) do
    IO.puts message
  end

  def send_message(dest_node, message) do
    spawn_task(__MODULE__, :receive_message, dest_node, [message])
  end

  def spawn_task(module, fun, dest_node, msg) do
    dest_node
    |> remote_supervisor()
    |> Task.Supervisor.async(module, fun, msg)
    |> Task.await()
  end

  defp remote_supervisor(dest_node) do
    {Monet.TaskSupervisor, dest_node}
  end
   
  
end
