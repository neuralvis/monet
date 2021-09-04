defmodule Monet.Pingpong do
  use Task 

  def start_link(arg) do
    send_message(:alex@localhost, "Alex, do you copy?")
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
