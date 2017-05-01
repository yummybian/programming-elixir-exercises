defmodule MyList do
  def maxlist(list), do: _maxlist(list, List.first(list)) 

  defp _maxlist([], max), do: max
  defp _maxlist([head|tail], max) when head > max, do: _maxlist(tail, head)
  defp _maxlist([_head|tail], max), do: _maxlist(tail, max)
end

