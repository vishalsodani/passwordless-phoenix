defmodule KnowledgeWeb.Router do
  use KnowledgeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug KnowledgeWeb.Plugs.SetCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KnowledgeWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/signin/:token", SessionsController, :show, as: :signin
    resources "/sessions", SessionsController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", KnowledgeWeb do
  #   pipe_through :api
  # end
end
