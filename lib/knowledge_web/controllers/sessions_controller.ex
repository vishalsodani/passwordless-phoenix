defmodule KnowledgeWeb.SessionsController do
    use KnowledgeWeb, :controller

    def new(conn, _params) do
        render(conn, "new.html")
    end

    def create(conn, %{"session" => %{"email" => email}}) do
        
    end

    def delete(conn, _params) do
        
    end
end