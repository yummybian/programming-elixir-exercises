defmodule Stack.Stash do
    use GenServer

    #####
    # API

    def start_link(current_stack) do
        {:ok, _pid} = GenServer.start_link(__MODULE__, current_stack)
    end

    def save_stack(pid, current_stack) do
        GenServer.cast pid, {:save_stack, current_stack}
    end

    def get_stack(pid) do
        GenServer.call pid, :get_stack
    end

    #####
    # GenServer

    def handle_call(:get_stack, _from, current_stack) do
        {:reply, current_stack, current_stack}
    end

    def handle_cast({:save_stack, current_stack}, _current_stack) do
        {:noreply, current_stack}
    end
end