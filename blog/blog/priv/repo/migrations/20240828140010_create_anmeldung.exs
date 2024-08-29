defmodule Blog.Repo.Migrations.CreateAnmeldung do
  use Ecto.Migration

  def change do
    create table(:anmeldung) do
      add :vorname, :string
      add :nachname, :string
      add :straße, :string
      add :hausnummer, :integer
      add :plz, :integer
      add :stadt, :string
      add :email, :string
      add :tel_festnetz, :integer
      add :tel_handy, :integer
      add :erreichbarkeit, :string
      add :vornameKind, :string
      add :nachnameKind, :string
      add :geburtstag, :date

      timestamps(type: :utc_datetime)
    end
  end
end
