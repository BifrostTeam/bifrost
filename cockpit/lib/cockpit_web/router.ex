defmodule CockpitWeb.Router do
  use CockpitWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug CockpitWeb.Auth.RequestSigningPlug
  end

  pipeline :dashboard do
    plug :browser
    plug CockpitWeb.Auth.LoginRequired
  end

  scope "/", CockpitWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/", PageController, :login
  end

  scope "/dashboard", CockpitWeb do
    pipe_through :dashboard

    get "/", DashboardController, :index
    get "/game_servers", GameServerController, :list
  end

  scope "/api", CockpitWeb.API do
    pipe_through :api

    get "/allocations", AllocationsController, :list_allocations
  end
end
