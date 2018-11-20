defmodule KnowledgeWeb.PageController do
  require Logger
  use KnowledgeWeb, :controller
  plug KnowledgeWeb.Plugs.AuthenticateUser when action not in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end
end
