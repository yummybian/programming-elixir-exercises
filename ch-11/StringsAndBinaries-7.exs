defmodule Tax do
    def do_tax do
        tax_rates = [ NC: 0.075, TX: 0.08 ]

        "StringsAndBinaries-7-data.txt"
        |> read_orders_from_file
        |> calculate_sales_tax(tax_rates)
    end

    def read_orders_from_file(filename) do
        {:ok, file} = File.open(filename, [:read])

        header = IO.read(file, :line)
        |> String.rstrip
        |> String.split(",")
        |> Enum.map(&String.to_atom/1)

        IO.stream(file, :line)
        |> Stream.map(&String.rstrip/1)
        |> Stream.map(&(String.split(&1, ",")))
        |> Stream.map(&convert_types/1)
        |> Stream.map(&(List.zip([header, &1])))
        |> Enum.to_list
    end

    def convert_types([s_int, s_atom, s_float]) do
        [ 
            s_int |> String.to_integer,
            s_atom |> String.trim_leading(":") |> String.to_atom,
            s_float |> String.to_float 
        ]
    end

    def calculate_sales_tax(orders, tax_rates) do
        orders
        |> Enum.map(&(calculate_tax(&1, tax_rates)))
    end
    
    defp calculate_tax(order = [id: _, ship_to: ship_to, net_amount: net_amount], tax_rates)  do
        tax_rate = Keyword.get(tax_rates, ship_to)
        multiplier = 1 + (tax_rate || 0)
        total_amount = net_amount * multiplier
        Keyword.put(order, :total_amount, total_amount)
    end
end

IO.inspect Tax.do_tax