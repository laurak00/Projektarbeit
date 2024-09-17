defmodule Kisiwo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :vorname, :string
      add :nachname, :string
      add :straße, :string
      add :hausnummer, :integer
      add :plz, :integer
      add :stadt, :string
      add :email, :string
      add :telefon_festnetz, :string
      add :telefon_handy, :string
      add :erreichbar, :text
      add :vorname_kind, :string
      add :nachname_kind, :string
      add :geburtstag, :date
      add :instrument, :text
      add :allergien, :boolean, default: false, null: false
      add :schwimmer, :string
      add :essen, :string
      add :kommentar, :text
      add :fotos, :string
      add :persoenliches_gespraech, :boolean, default: false, null: false
      add :teilnahmebedingungen, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
