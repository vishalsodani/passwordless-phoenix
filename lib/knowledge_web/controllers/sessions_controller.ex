defmodule KnowledgeWeb.SessionsController do
    use KnowledgeWeb, :controller

    def new(conn, _params) do
        render(conn, "new.html")
    end

    def create(conn, %{"session" => %{"email" => email}}) do
        conn
        |> put_flash(:info, "We have sent you a link for signing in via email to #{email}.")
        |> redirect(to: Routes.page_path(conn, :index))
    end

    def delete(conn, _params) do
        
    end
end