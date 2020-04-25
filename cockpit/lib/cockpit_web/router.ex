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

  scope "/", CockpitWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", CockpitWeb.API do
    pipe_through :api

    scope "/allocations", nil do
      get "/", AllocationsController, :list_allocations
    end
  end
end
