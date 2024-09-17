defmodule Kisiwo.AnmeldungFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kisiwo.Anmeldung` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        allergien: true,
        email: "some email",
        erreichbar: "some erreichbar",
        essen: :alles,
        fotos: :veroeffentlicht,
        geburtstag: ~D[2024-08-28],
        hausnummer: 42,
        instrument: "some instrument",
        kommentar: "some kommentar",
        nachname: "some nachname",
        nachname_kind: "some nachname_kind",
        persoenliches_gespraech: true,
        plz: 42,
        schwimmer: :schwimmer,
        stadt: "some stadt",
        straße: "some straße",
        teilnahmebedingungen: true,
        telefon_festnetz: "some telefon_festnetz",
        telefon_handy: "some telefon_handy",
        vorname: "some vorname",
        vorname_kind: "some vorname_kind"
      })
      |> Kisiwo.Anmeldung.create_users()

    users
  end
end
