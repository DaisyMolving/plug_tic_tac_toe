defmodule Board do

  defstruct current_state: 
  [:empty, :empty, :empty, 
   :empty, :empty, :empty, 
   :empty, :empty, :empty] 

 def empty?(board) do
   Enum.all?(board, fn(position) ->
     position == :empty
   end)
 end

 def mark(board, cell_to_mark, symbol) do
   List.replace_at(board, cell_to_mark, symbol)
 end

 def available_cell?(board, cell) do
   Enum.at(board, cell) == :empty
 end

 def rows(board) do
   Enum.chunk(board, 3)
 end

 def columns([a1, a2, a3, b1, b2, b3, c1, c2, c3]) do
   [[a1, b1, c1], [a2, b2, c2], [a3, b3, c3]]
 end

 def diagonals([a1, _a2, a3, _b1, b2, _b3, c1, _c2, c3]) do
   [[a1, b2, c3], [a3, b2, c1]]
 end

 def win?(board) do
   Enum.any?(sequences(board), fn(sequence) ->
     all_same?(sequence) 
   end)
 end

 def draw?(board) do
   !win?(board) and !in_play?(board)
 end

 defp in_play?(board) do
   Enum.any?(board, fn(position) ->
     position == :empty
   end)
 end

 defp sequences(board) do
   rows(board) ++ columns(board) ++ diagonals(board)
 end

 defp all_same?(["x", "x", "x"]), do: true
 defp all_same?(["o", "o", "o"]), do: true
 defp all_same?(_), do: false

end
