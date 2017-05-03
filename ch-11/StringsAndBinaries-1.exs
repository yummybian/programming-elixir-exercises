defmodule MyString do
    def printable_ascii(sqs), do: Enum.all?(sqs, fn ch -> ch in ? ..?~ end)
end

IO.inspect MyString.printable_ascii('cat!')    #=> true
IO.inspect MyString.printable_ascii('∂x/∂y')   #=> false