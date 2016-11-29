defmodule Router do
  use Plug.Router
  import Plug.Conn

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> send_resp(200, Display.template_index)
  end

end
