defmodule FizzBuzz1 do
    
    def upto(n) when n > 0, do: _upto(n, [])

    defp _upto(0, result), do: result

    defp _upto(current, result) do
        next_answer = 
            case {rem(current, 3), rem(current, 5)} do
                {0, 0} -> "FizzBuzz"
                {0, _} -> "Fizz"
                {_, 0} -> "Buzz"
                {_, _} -> current
            end
        _upto(current-1, [next_answer | result])
    end
end

defmodule FizzBuzz2 do 
    
    def upto(n) when n > 0 do 
        1..n |> Enum.map(&fizzbuzz(&1))
    end
    
    defp fizzbuzz(n) do
        case {rem(n, 3), rem(n, 5), n} do 
            {0, 0, _} -> "FizzBuzz"
            {0, _, _} -> "Fizz"
            {_, 0, _} -> "Buzz"
            {_, _, n} -> n 
        end
    end
end

defmodule FizzBuzz3 do 
    
    def upto(n) when n > 0 do 
        1..n |> Enum.map(&fizzbuzz(&1))
    end

    defp fizzbuzz(n) when rem(n, 3) == 0 and rem(n, 5) == 0, do: "FizzBuzz"
    defp fizzbuzz(n) when rem(n, 3) == 0, do: "Fizz"
    defp fizzbuzz(n) when rem(n, 5) == 0, do: "Buzz"
    defp fizzbuzz(n), do: n 
    
end


IO.inspect FizzBuzz1.upto(20)
IO.inspect FizzBuzz2.upto(20)
IO.inspect FizzBuzz3.upto(20)