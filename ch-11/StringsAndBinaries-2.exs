defmodule MyString do
    def anagram(sqs1, sqs2), do: Enum.sort(sqs1) == Enum.sort(sqs2)
end

IO.inspect MyString.anagram('cat', 'act')                    #=> true
IO.inspect MyString.anagram('cat', 'actor')                  #=> false
IO.inspect MyString.anagram('incorporates', 'procreations')  #=> true