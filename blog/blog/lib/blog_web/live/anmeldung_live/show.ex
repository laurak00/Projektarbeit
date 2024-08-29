defmodule BlogWeb.AnmeldungLive.Show do
  use BlogWeb, :live_view

  alias Blog.Kisiwo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:anmeldung, Kisiwo.get_anmeldung!(id))}
  end

  defp page_title(:show), do: "Show Anmeldung"
  defp page_title(:edit), do: "Edit Anmeldung"
end
