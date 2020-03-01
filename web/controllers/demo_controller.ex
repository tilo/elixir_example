defmodule ElixirExample.DemoController do
  use ElixirExample.Web, :controller
  require Logger

  def index(conn, _params) do
    # log(conn)
    text conn, "Hello World from #{ip()} with foo as #{foo()} url: #{current_url(conn)}"
  end

  def echo(conn, _params) do
    # log(conn)
    text conn, "loaderio-757ad3993948d06bd057710711dd9a66"
  end

  # private functions

  # defp log(conn) do
  #   # url = ElixirExample.Router.Helpers.url(conn) <> conn.request_path
  #   Logger.info  "Received request for URL: #{current_url(conn)}"
  # end

  # returns a string with the IP address of eth0
  defp ip do
    {:ok, socket} =  :inet.getif()
    [eth0 | _rest] = socket
    {ip, _mask, _net} = eth0
    Enum.join(Tuple.to_list(ip), ".")
  end

  # fetch value of ENV variable FOO
  defp foo do
    {:ok, value} = System.fetch_env("FOO")
    value
  end
end
