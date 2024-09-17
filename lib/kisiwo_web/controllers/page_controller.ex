defmodule KisiwoWeb.PageController do
  use KisiwoWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def kisiwo(conn, _params) do
    render(conn, :kisiwo, layout: false)
  end

  def team(conn, _params) do
    render(conn, :team, layout: false)
  end

  def contact(conn, _params) do
    render(conn, :contact, layout: false)
  end




  # get "/kisiwo", PageController, :kisiwo
  # get "/team", PageController, :team
  # get "/contact", PageController, :contact
end
