defmodule Monet.Ping do
  use Task

  def start_link(arg) do
    
  end
  
  def receive(message) do
    IO.puts message
  end

  def send(recipient, message) do
  end
  
  
end
