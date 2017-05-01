defmodule ServerTest do
  use ExUnit.Case

  test "push elements to stack" do
    test_values = 1..10

    test_values
    |> Enum.each &(Stack.Server.push $1)

    test_values
    |> Enum.reverse
    |> Enum.each &(assert Stack.Server.pop == $1)
  end
end