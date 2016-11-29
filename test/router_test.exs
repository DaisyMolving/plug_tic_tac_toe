defmodule RouterTest do
  use ExUnit.Case
  use Plug.Test

  @opts Router.init([])

  test "goes to index page" do
    conn = conn(:get, "/", Display.template_index)
    |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
  end
  
end
