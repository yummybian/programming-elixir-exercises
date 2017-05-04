defmodule MyString do
    
    def center(strings) do
        strings
        |> center_strings
        |> Enum.each(&IO.puts/1)
    end

    defp center_strings(strings) do
        max_length = strings |> Enum.map(&String.length/1) |> Enum.max
        in_width = fn (string) -> div((max_length - String.length(string)), 2) + String.length(string) end 
        strings |> Enum.map(&(String.rjust(&1, in_width.(&1))))
    end
end

MyString.center(["cat", "zebra", "elephant"])