defmodule BlogWeb.AnmeldungLive.FormComponent do
  use BlogWeb, :live_component

  alias Blog.Kisiwo
  #Popup um neue Anmeldung einzutragen!

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage Anmeldung records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="anmeldung-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:vorname]} type="text" label="Vorname" />
        <.input field={@form[:nachname]} type="text" label="Nachname" />
        <.input field={@form[:straße]} type="text" label="Straße" />
        <.input field={@form[:hausnummer]} type="number" label="Hausnummer" />
        <.input field={@form[:plz]} type="number" label="PLZ" />
        <.input field={@form[:stadt]} type="text" label="Stadt" />
        <.input field={@form[:email]} type="text" label="Email" />
        <.input field={@form[:tel_festnetz]} type="number" label="Telefon Festnetz" />
        <.input field={@form[:tel_handy]} type="number" label="Telefon Handy" />
        <.input field={@form[:erreichbarkeit]} type="text" label="Erreichbarkeit" />
        <.input field={@form[:vornameKind]} type="text" label="Vorname Kind" />
        <.input field={@form[:nachnameKind]} type="text" label="Nachname Kind" />
        <.input field={@form[:geburtstag]} type="date" label="Geburtstag" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Anmeldung</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{anmeldung: anmeldung} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Kisiwo.change_anmeldung(anmeldung))
     end)}
  end

  @impl true
  def handle_event("validate", %{"anmeldung" => anmeldung_params}, socket) do
    changeset = Kisiwo.change_anmeldung(socket.assigns.anmeldung, anmeldung_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"anmeldung" => anmeldung_params}, socket) do
    save_anmeldung(socket, socket.assigns.action, anmeldung_params)
  end

  defp save_anmeldung(socket, :edit, anmeldung_params) do
    case Kisiwo.update_anmeldung(socket.assigns.anmeldung, anmeldung_params) do
      {:ok, anmeldung} ->
        notify_parent({:saved, anmeldung})

        {:noreply,
         socket
         |> put_flash(:info, "Anmeldung updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_anmeldung(socket, :new, anmeldung_params) do
    case Kisiwo.create_anmeldung(anmeldung_params) do
      {:ok, anmeldung} ->
        notify_parent({:saved, anmeldung})

        {:noreply,
         socket
         |> put_flash(:info, "Anmeldung created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
