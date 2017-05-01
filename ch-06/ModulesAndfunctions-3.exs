defmodule Times do
  def triple(n), do: n * n *n
  def quadruple(n), do: double(n) * 2

  defp double(n), do: n * 2
end
