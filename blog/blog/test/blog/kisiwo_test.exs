defmodule Blog.KisiwoTest do
  use Blog.DataCase

  alias Blog.Kisiwo

  describe "anmeldung" do
    alias Blog.Kisiwo.Anmeldung

    import Blog.KisiwoFixtures

    @invalid_attrs %{vorname: nil, nachname: nil, straße: nil, hausnummer: nil, plz: nil, stadt: nil, email: nil, tel_festnetz: nil, tel_handy: nil, erreichbarkeit: nil, vornameKind: nil, nachnameKind: nil, geburtstag: nil}

    test "list_anmeldung/0 returns all anmeldung" do
      anmeldung = anmeldung_fixture()
      assert Kisiwo.list_anmeldung() == [anmeldung]
    end

    test "get_anmeldung!/1 returns the anmeldung with given id" do
      anmeldung = anmeldung_fixture()
      assert Kisiwo.get_anmeldung!(anmeldung.id) == anmeldung
    end

    test "create_anmeldung/1 with valid data creates a anmeldung" do
      valid_attrs = %{vorname: "some vorname", nachname: "some nachname", straße: "some straße", hausnummer: 42, plz: 42, stadt: "some stadt", email: "some email", tel_festnetz: 42, tel_handy: 42, erreichbarkeit: "some erreichbarkeit", vornameKind: "some vornameKind", nachnameKind: "some nachnameKind", geburtstag: ~D[2024-08-27]}

      assert {:ok, %Anmeldung{} = anmeldung} = Kisiwo.create_anmeldung(valid_attrs)
      assert anmeldung.vorname == "some vorname"
      assert anmeldung.nachname == "some nachname"
      assert anmeldung.straße == "some straße"
      assert anmeldung.hausnummer == 42
      assert anmeldung.plz == 42
      assert anmeldung.stadt == "some stadt"
      assert anmeldung.email == "some email"
      assert anmeldung.tel_festnetz == 42
      assert anmeldung.tel_handy == 42
      assert anmeldung.erreichbarkeit == "some erreichbarkeit"
      assert anmeldung.vornameKind == "some vornameKind"
      assert anmeldung.nachnameKind == "some nachnameKind"
      assert anmeldung.geburtstag == ~D[2024-08-27]
    end

    test "create_anmeldung/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kisiwo.create_anmeldung(@invalid_attrs)
    end

    test "update_anmeldung/2 with valid data updates the anmeldung" do
      anmeldung = anmeldung_fixture()
      update_attrs = %{vorname: "some updated vorname", nachname: "some updated nachname", straße: "some updated straße", hausnummer: 43, plz: 43, stadt: "some updated stadt", email: "some updated email", tel_festnetz: 43, tel_handy: 43, erreichbarkeit: "some updated erreichbarkeit", vornameKind: "some updated vornameKind", nachnameKind: "some updated nachnameKind", geburtstag: ~D[2024-08-28]}

      assert {:ok, %Anmeldung{} = anmeldung} = Kisiwo.update_anmeldung(anmeldung, update_attrs)
      assert anmeldung.vorname == "some updated vorname"
      assert anmeldung.nachname == "some updated nachname"
      assert anmeldung.straße == "some updated straße"
      assert anmeldung.hausnummer == 43
      assert anmeldung.plz == 43
      assert anmeldung.stadt == "some updated stadt"
      assert anmeldung.email == "some updated email"
      assert anmeldung.tel_festnetz == 43
      assert anmeldung.tel_handy == 43
      assert anmeldung.erreichbarkeit == "some updated erreichbarkeit"
      assert anmeldung.vornameKind == "some updated vornameKind"
      assert anmeldung.nachnameKind == "some updated nachnameKind"
      assert anmeldung.geburtstag == ~D[2024-08-28]
    end

    test "update_anmeldung/2 with invalid data returns error changeset" do
      anmeldung = anmeldung_fixture()
      assert {:error, %Ecto.Changeset{}} = Kisiwo.update_anmeldung(anmeldung, @invalid_attrs)
      assert anmeldung == Kisiwo.get_anmeldung!(anmeldung.id)
    end

    test "delete_anmeldung/1 deletes the anmeldung" do
      anmeldung = anmeldung_fixture()
      assert {:ok, %Anmeldung{}} = Kisiwo.delete_anmeldung(anmeldung)
      assert_raise Ecto.NoResultsError, fn -> Kisiwo.get_anmeldung!(anmeldung.id) end
    end

    test "change_anmeldung/1 returns a anmeldung changeset" do
      anmeldung = anmeldung_fixture()
      assert %Ecto.Changeset{} = Kisiwo.change_anmeldung(anmeldung)
    end
  end
end
