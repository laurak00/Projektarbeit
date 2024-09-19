defmodule Kisiwo.Anmeldung.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :vorname, :string
    field :nachname, :string
    field :straße, :string
    field :hausnummer, :integer
    field :plz, :integer
    field :stadt, :string
    field :email, :string
    field :telefon_festnetz, :string
    field :telefon_handy, :string
    field :erreichbar, :string
    field :vorname_kind, :string
    field :nachname_kind, :string
    field :geburtstag, :date
    field :instrument, :string
    field :allergien, :boolean, default: false
    field :schwimmer, Ecto.Enum, values: [:Schwimmer, :Nichtschwimmer]
    field :essen, Ecto.Enum, values: [:alles, :vegetarisch, :vegan, :Unverträglichkeit]
    field :kommentar, :string
    field :fotos, Ecto.Enum, values: [:veroeffentlicht, :nichtveroeffentlicht]
    field :persoenliches_gespraech, :boolean, default: false
    field :teilnahmebedingungen, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:vorname, :nachname, :straße, :hausnummer, :plz, :stadt, :email, :telefon_festnetz, :telefon_handy, :erreichbar, :vorname_kind, :nachname_kind, :geburtstag, :instrument, :allergien, :schwimmer, :essen, :kommentar, :fotos, :persoenliches_gespraech, :teilnahmebedingungen])
    |> validate_required([:vorname, :nachname, :straße, :hausnummer, :plz, :stadt, :email, :telefon_festnetz, :telefon_handy, :erreichbar, :vorname_kind, :nachname_kind, :geburtstag, :instrument, :allergien, :schwimmer, :essen, :kommentar, :fotos, :persoenliches_gespraech, :teilnahmebedingungen])
  end
end
