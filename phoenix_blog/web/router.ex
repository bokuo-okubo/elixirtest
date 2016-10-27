defmodule PhoenixBlog.Router do
  use PhoenixBlog.Web, :router

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

  scope "/", PhoenixBlog do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    resources "/posts", PostController
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
  end

  scope "/api", PhoenixBlog do
    pipe_through :api # Use the default browser stack
    resources "/anime/v1/twitter/follower/status", TwitterFollowerStatusController, only: [:index]
    resources "/anime/v1/twitter/follower/history", TwitterFollowerHistoryController, only: [:index]
  end
end
