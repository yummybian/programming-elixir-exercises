defmodule Check do

    def ok!({:ok, data}) do data end
    def ok!(whatever) do raise IO.inspect(whatever) end
end


IO.inspect Check.ok! File.open("somefile")