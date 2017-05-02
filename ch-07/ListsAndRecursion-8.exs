defmodule MyList do
  def calcOrders(order)
end

for n <- MyList.span(2, 10), MyList.prime(n), do: n

