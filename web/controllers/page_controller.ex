defmodule Superrentals.PageController do
  use Superrentals.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
