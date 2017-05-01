defmodule Stack.Server do
    use GenServer


    #####
    # Client API
    def start_link(stack) do
        GenServer.start_link(__MODULE__, stack, name: __MODULE__)
    end

    def pop do
        GenServer.call __MODULE__, :pop
    end

    def push(item) do
        GenServer.cast __MODULE__, {:push, item}
    end

    #####
    # Server API

    def handle_call(:pop, _from, [top|rest]) do
        {:reply, top, rest}
    end
    
    def handle_cast({:push, item}, stack) do
        {:noreply, [item|stack]}
    end

    def format_status(_reason, [_pdict, state]) do
        [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
    end

    def terminate(reason, state) do
        IO.puts reason
    end
end