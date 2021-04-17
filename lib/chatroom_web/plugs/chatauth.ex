defmodule ChatroomWeb.Plugs.ChatAuth do
  import Plug.Conn

  def init(default), do: default

  defp put_user_token(conn) do
    current_userid = :rand.uniform(1000)
    token = Phoenix.Token.sign(conn, "user socket", current_userid)
    assign(conn, :user_token, token)
  end

  def call(conn, _default) do
    conn
    |> put_user_token
  end

end
