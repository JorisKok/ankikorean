defmodule AnkikoreanWeb.Router do
  use AnkikoreanWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AnkikoreanWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/v1/", AnkikoreanWeb do
    pipe_through :api

    get "/translate", TranslateController, :translate
    delete "/translate", TranslateController, :delete
    get "/export", ExportController, :export
  end

  # Other scopes may use custom stacks.
  # scope "/api", AnkikoreanWeb do
  #   pipe_through :api
  # end
end
