defmodule KisiwoWeb.Router do
  use KisiwoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {KisiwoWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KisiwoWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/users", UsersLive.Index, :index
    live "/users/new", UsersLive.Index, :new
    live "/users/:id/edit", UsersLive.Index, :edit

    live "/users/:id", UsersLive.Show, :show
    live "/users/:id/show/edit", UsersLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", KisiwoWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:kisiwo, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: KisiwoWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
