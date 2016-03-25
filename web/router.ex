defmodule Superrentals.Router do
  use Superrentals.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Corsica, origins: "http://localhost:4200"

  end

  scope "/api", Superrentals do
    pipe_through :api
    resources "/rentals", RentalController, except: [:new, :edit]
  end

  scope "/", Superrentals do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Superrentals do
  #   pipe_through :api
  # end
end
