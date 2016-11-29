defmodule BoardTest do
  use ExUnit.Case

  test "a new board has nine empty positions" do
    new_board = %Board{}.current_state

    assert length(new_board) == 9
    assert Board.empty?(new_board) == true
  end

  test "a board can be marked" do
    new_board = %Board{}.current_state
    {cell_to_mark, symbol} = {0, "x"}

    assert Board.mark(new_board, cell_to_mark, symbol) == 
      ["x", :empty, :empty, 
       :empty, :empty, :empty, 
       :empty, :empty, :empty]
  end

  test "a board knows if cell is available" do
    current_board = 
      ["x", :empty, :empty, 
       :empty, :empty, :empty, 
       :empty, :empty, :empty]

     assert Board.available_cell?(current_board, 0) == false
     assert Board.available_cell?(current_board, 8) == true
  end

  test "a board has rows" do
    current_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    assert Board.rows(current_board) == 
      [["1", "2", "3"],
       ["4", "5", "6"],
       ["7", "8", "9"]]
  end

  test "a board has columns" do
    current_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    assert Board.columns(current_board) == 
      [["1", "4", "7"],
       ["2", "5", "8"],
       ["3", "6", "9"]]
  end

  test "a board has diagonals" do
    current_board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    assert Board.diagonals(current_board) == 
      [["1", "5", "9"],
       ["3", "5", "7"]]
  end

  test "a board recognises a row win" do
    current_board = 
      ["x", "x", "x", 
       :empty, :empty, :empty, 
       :empty, :empty, :empty]

     assert Board.win?(current_board) == true
    current_board = 
      ["x", "o", "x", 
       :empty, :empty, :empty,
       :empty, :empty, :empty]

     assert Board.win?(current_board) == false
  end

  test "a board recognises a column win" do
    current_board = 
      ["x", :empty, :empty, 
       "x", :empty, :empty, 
       "x", :empty, :empty]

     assert Board.win?(current_board) == true
    current_board = 
      ["x", :empty, :empty, 
       "o", :empty, :empty, 
       "x", :empty, :empty]

     assert Board.win?(current_board) == false
  end

  test "a board recognises a diagonal win" do
    current_board = 
      ["o", :empty, :empty, 
       :empty, "o", :empty, 
       :empty, :empty, "o"]

     assert Board.win?(current_board) == true
    current_board = 
      ["x", :empty, :empty, 
       :empty, "o", :empty, 
       :empty, :empty, "o"]

     assert Board.win?(current_board) == false
  end

  test "a board recognises a draw" do
    current_board = 
      ["o", "x", "o", 
       "o", "x", "o", 
       "x", "o", "x"]

     assert Board.draw?(current_board) == true
    current_board = 
      ["o", "x", "o", 
       "o", "x", "o", 
       "x", "o", :empty]

     assert Board.draw?(current_board) == false
    current_board = 
      ["o", "x", "o", 
       "o", "x", "o", 
       "x", "o", "o"]

     assert Board.draw?(current_board) == false
  end

end
