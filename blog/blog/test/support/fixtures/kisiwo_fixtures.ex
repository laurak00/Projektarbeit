defmodule Blog.KisiwoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Kisiwo` context.
  """

  @doc """
  Generate a anmeldung.
  """
  def anmeldung_fixture(attrs \\ %{}) do
    {:ok, anmeldung} =
      attrs
      |> Enum.into(%{
        email: "some email",
        erreichbarkeit: "some erreichbarkeit",
        geburtstag: ~D[2024-08-27],
        hausnummer: 42,
        nachname: "some nachname",
        nachnameKind: "some nachnameKind",
        plz: 42,
        stadt: "some stadt",
        straße: "some straße",
        tel_festnetz: 42,
        tel_handy: 42,
        vorname: "some vorname",
        vornameKind: "some vornameKind"
      })
      |> Blog.Kisiwo.create_anmeldung()

    anmeldung
  end
end
