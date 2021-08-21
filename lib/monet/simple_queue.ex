defmodule Monet.SimpleQueue do
  use GenServer

  # Client APIs
  
  @doc """
  Helper function
  """
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def queue() do
    GenServer.call(__MODULE__, :queue)
  end

  def dequeue() do
    GenServer.call(__MODULE__, :dequeue)
  end

  def enqueue(element) do
    GenServer.cast(__MODULE__, {:enqueue, element})
  end
    
  
  # Server callbacks
  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:queue, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:dequeue, _from, [head | state]) do
    {:reply, head, state}
  end

  @impl true
  def handle_call(:dequeue, _from, []) do
    {:reply, nil, []}
  end

  @impl true
  def handle_cast({:enqueue, element}, state) do
    {:noreply, state ++ [element]}
  end
end
