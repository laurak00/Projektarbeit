defmodule Blog.Kisiwo.Anmeldung do
  use Ecto.Schema
  import Ecto.Changeset

  schema "anmeldung" do
    field :vorname, :string
    field :nachname, :string
    field :straße, :string
    field :hausnummer, :integer
    field :plz, :integer
    field :stadt, :string
    field :email, :string
    field :tel_festnetz, :integer
    field :tel_handy, :integer
    field :erreichbarkeit, :string
    field :vornameKind, :string
    field :nachnameKind, :string
    field :geburtstag, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(anmeldung, attrs) do
    anmeldung
    |> cast(attrs, [:vorname, :nachname, :straße, :hausnummer, :plz, :stadt, :email, :tel_festnetz, :tel_handy, :erreichbarkeit, :vornameKind, :nachnameKind, :geburtstag])
    |> validate_required([:vorname, :nachname, :straße, :hausnummer, :plz, :stadt, :email, :tel_festnetz, :tel_handy, :erreichbarkeit, :vornameKind, :nachnameKind, :geburtstag])
  end
end
