defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, to), do: [ from | span(from+1, to) ]

  def prime(n), do: _prime(2, n)
  defp _prime(n, n), do: true
  defp _prime(x, n) do
    if rem(n, x) == 0 do
      false
    else
      _prime(x+1, n)
    end
  end
end

for n <- MyList.span(2, 10), MyList.prime(n), do: n

