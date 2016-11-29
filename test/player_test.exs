defmodule Player.Test do

  use ExUnit.Case

  test "player has default marker" do
    new_player = %Player{}
    assert new_player.marker == ""
  end

  test "player can have distinct marker when built" do
    new_player = Player.build("x")
    assert new_player.marker == "x"
  end

end
