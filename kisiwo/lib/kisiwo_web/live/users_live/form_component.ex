defmodule KisiwoWeb.UsersLive.FormComponent do
  use KisiwoWeb, :live_component

  alias Kisiwo.Anmeldung

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage users records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="users-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:vorname]} type="text" label="Vorname" />
        <.input field={@form[:nachname]} type="text" label="Nachname" />
        <.input field={@form[:straße]} type="text" label="Straße" />
        <.input field={@form[:hausnummer]} type="number" label="Hausnummer" />
        <.input field={@form[:plz]} type="number" label="Plz" />
        <.input field={@form[:stadt]} type="text" label="Stadt" />
        <.input field={@form[:email]} type="text" label="Email" />
        <.input field={@form[:telefon_festnetz]} type="text" label="Telefon festnetz" />
        <.input field={@form[:telefon_handy]} type="text" label="Telefon handy" />
        <.input field={@form[:erreichbar]} type="text" label="Erreichbar" />
        <.input field={@form[:vorname_kind]} type="text" label="Vorname kind" />
        <.input field={@form[:nachname_kind]} type="text" label="Nachname kind" />
        <.input field={@form[:geburtstag]} type="date" label="Geburtstag" />
        <.input field={@form[:instrument]} type="text" label="Instrument" />
        <.input field={@form[:allergien]} type="checkbox" label="Allergien" />
        <.input
          field={@form[:schwimmer]}
          type="select"
          label="Schwimmer"
          prompt="Choose a value"
          options={Ecto.Enum.values(Kisiwo.Anmeldung.Users, :schwimmer)}
        />
        <.input
          field={@form[:essen]}
          type="select"
          label="Essen"
          prompt="Choose a value"
          options={Ecto.Enum.values(Kisiwo.Anmeldung.Users, :essen)}
        />
        <.input field={@form[:kommentar]} type="text" label="Kommentar" />
        <.input
          field={@form[:fotos]}
          type="select"
          label="Fotos"
          prompt="Choose a value"
          options={Ecto.Enum.values(Kisiwo.Anmeldung.Users, :fotos)}
        />
        <.input field={@form[:persoenliches_gespraech]} type="checkbox" label="Persoenliches gespraech" />
        <.input field={@form[:teilnahmebedingungen]} type="checkbox" label="Teilnahmebedingungen" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Users</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{users: users} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Anmeldung.change_users(users))
     end)}
  end

  @impl true
  def handle_event("validate", %{"users" => users_params}, socket) do
    changeset = Anmeldung.change_users(socket.assigns.users, users_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"users" => users_params}, socket) do
    save_users(socket, socket.assigns.action, users_params)
  end

  defp save_users(socket, :edit, users_params) do
    case Anmeldung.update_users(socket.assigns.users, users_params) do
      {:ok, users} ->
        notify_parent({:saved, users})

        {:noreply,
         socket
         |> put_flash(:info, "Users updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_users(socket, :new, users_params) do
    case Anmeldung.create_users(users_params) do
      {:ok, users} ->
        notify_parent({:saved, users})

        {:noreply,
         socket
         |> put_flash(:info, "Users created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
