defmodule ElixirExample.Router do
  use ElixirExample.Web, :router

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

  pipeline :minimal do
    plug :accepts, ["txt","html"]
  end

  scope "/", ElixirExample do
    pipe_through :minimal

    get "/", DemoController, :index
    get "/loaderio-757ad3993948d06bd057710711dd9a66.txt", DemoController, :echo
  end

  scope "/web", ElixirExample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirExample do
  #   pipe_through :api
  # end
end
