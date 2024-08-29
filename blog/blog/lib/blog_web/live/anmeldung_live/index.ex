defmodule BlogWeb.AnmeldungLive.Index do
  use BlogWeb, :live_view

  alias Blog.Kisiwo
  alias Blog.Kisiwo.Anmeldung

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :anmeldung_collection, Kisiwo.list_anmeldung())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Anmeldung")
    |> assign(:anmeldung, Kisiwo.get_anmeldung!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Anmeldung")
    |> assign(:anmeldung, %Anmeldung{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Anmeldung")
    |> assign(:anmeldung, nil)
  end

  @impl true
  def handle_info({BlogWeb.AnmeldungLive.FormComponent, {:saved, anmeldung}}, socket) do
    {:noreply, stream_insert(socket, :anmeldung_collection, anmeldung)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    anmeldung = Kisiwo.get_anmeldung!(id)
    {:ok, _} = Kisiwo.delete_anmeldung(anmeldung)

    {:noreply, stream_delete(socket, :anmeldung_collection, anmeldung)}
  end
end
