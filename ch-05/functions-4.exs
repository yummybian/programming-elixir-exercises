prefix1 = fn s1 ->
  fn s2 ->
    IO.puts s1 <> " " <> s2
  end
end

prefix2 = fn s1 ->
  fn s2 ->
    Enum.join([s1, s2], " ")
  end
end



