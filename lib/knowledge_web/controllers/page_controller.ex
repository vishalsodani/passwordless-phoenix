defmodule KnowledgeWeb.PageController do
  require Logger
  use KnowledgeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
