defmodule KnowledgeWeb.PageController do
  require Logger
  use KnowledgeWeb, :controller

  def index(conn, _params) do
    user_id = get_session(conn, :user_id)
    Logger.info user_id
    render(conn, "index.html")
  end
end
