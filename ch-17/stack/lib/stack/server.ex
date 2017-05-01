defmodule Stack.Server do
    use GenServer

    #####
    # Client API
    def start_link(stash_pid) do
        {:ok, _pid} = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
    end

    def pop do
        GenServer.call __MODULE__, :pop
    end

    def push(item) do
        GenServer.cast __MODULE__, {:push, item}
    end

    #####
    # Server API

    def init(stash_pid) do
        current_stack = Stack.Stash.get_stack stash_pid
        {:ok, {current_stack, stash_pid}}
    end

    def handle_call(:pop, _from, {[top|rest], stash_pid}) do
        {:reply, top, {rest, stash_pid}}
    end
    
    def handle_cast({:push, item}, {stack, stash_pid}) do
        {:noreply, {[item|stack], stash_pid}}
    end

    def format_status(_reason, [_pdict, state]) do
        [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
    end

    def terminate(_reason, {current_stack, stash_pid}) do
        Stack.Stash.save_stack stash_pid, current_stack
    end
end