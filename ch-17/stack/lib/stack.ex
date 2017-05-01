defmodule Stack do
  use Application

  @initial_state [1, "Jacky", 2]

  def start(_type, _args) do
    {:ok, _pid} = Stack.Supervisor.start_link(@initial_state)
  end
end