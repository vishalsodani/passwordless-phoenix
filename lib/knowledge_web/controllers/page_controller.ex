defmodule KnowledgeWeb.PageController do
  use KnowledgeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
