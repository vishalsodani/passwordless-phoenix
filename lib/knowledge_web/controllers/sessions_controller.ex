defmodule KnowledgeWeb.SessionsController do
    use KnowledgeWeb, :controller

    alias KnowledgeWeb.TokenAuthentication

    def new(conn, _params) do
        render(conn, "new.html")
    end

    def create(conn, %{"session" => %{"email" => email}}) do
        TokenAuthentication.provide_token(email)

        conn
        |> put_flash(:info, "We have sent you a link for signing in via email to #{email}.")
        |> redirect(to: Routes.page_path(conn, :index))
    end

    def delete(conn, _params) do
        
    end

    def show(conn, %{"token" => token}) do
        case TokenAuthentication.verify_token_value(token) do
          {:ok, user} ->
            conn
            |> assign(:current_user, user)
            |> put_session(:user_id, user.id)
            |> configure_session(renew: true)
            |> put_flash(:info, "You signed in successfully.")
            |> redirect(to: Routes.page_path(conn, :index))
    
          {:error, _reason} ->
            conn
            |> put_flash(:error, "The login token is invalid.")
            |> redirect(to: Routes.sessions_path(conn, :new))
        end
      end
end