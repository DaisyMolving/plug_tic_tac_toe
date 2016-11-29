defmodule PlugTicTacToe do
  use Application
  import Plug.Conn

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Router, [], [port: 4001])
    ]

    opts = [strategy: :one_for_one, name: PlugTicTacToe.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def init(opts), do: opts

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("application/json")
  end

end
