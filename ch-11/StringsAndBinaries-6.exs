defmodule MyString do
    
    def capitalize_sentences(string) do
        string
        |> String.split(~r{\.\s+})
        |> Enum.map(&String.capitalize/1)
        |> Enum.join(". ")
    end
end

IO.inspect MyString.capitalize_sentences("oh. a DOG. woof. ")