defmodule Kisiwo.AnmeldungTest do
  use Kisiwo.DataCase

  alias Kisiwo.Anmeldung

  describe "users" do
    alias Kisiwo.Anmeldung.Users

    import Kisiwo.AnmeldungFixtures

    @invalid_attrs %{vorname: nil, nachname: nil, straße: nil, hausnummer: nil, plz: nil, stadt: nil, email: nil, telefon_festnetz: nil, telefon_handy: nil, erreichbar: nil, vorname_kind: nil, nachname_kind: nil, geburtstag: nil, instrument: nil, allergien: nil, schwimmer: nil, essen: nil, kommentar: nil, fotos: nil, persoenliches_gespraech: nil, teilnahmebedingungen: nil}

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Anmeldung.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Anmeldung.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{vorname: "some vorname", nachname: "some nachname", straße: "some straße", hausnummer: 42, plz: 42, stadt: "some stadt", email: "some email", telefon_festnetz: "some telefon_festnetz", telefon_handy: "some telefon_handy", erreichbar: "some erreichbar", vorname_kind: "some vorname_kind", nachname_kind: "some nachname_kind", geburtstag: ~D[2024-08-28], instrument: "some instrument", allergien: true, schwimmer: :schwimmer, essen: :alles, kommentar: "some kommentar", fotos: :veroeffentlicht, persoenliches_gespraech: true, teilnahmebedingungen: true}

      assert {:ok, %Users{} = users} = Anmeldung.create_users(valid_attrs)
      assert users.vorname == "some vorname"
      assert users.nachname == "some nachname"
      assert users.straße == "some straße"
      assert users.hausnummer == 42
      assert users.plz == 42
      assert users.stadt == "some stadt"
      assert users.email == "some email"
      assert users.telefon_festnetz == "some telefon_festnetz"
      assert users.telefon_handy == "some telefon_handy"
      assert users.erreichbar == "some erreichbar"
      assert users.vorname_kind == "some vorname_kind"
      assert users.nachname_kind == "some nachname_kind"
      assert users.geburtstag == ~D[2024-08-28]
      assert users.instrument == "some instrument"
      assert users.allergien == true
      assert users.schwimmer == :schwimmer
      assert users.essen == :alles
      assert users.kommentar == "some kommentar"
      assert users.fotos == :veroeffentlicht
      assert users.persoenliches_gespraech == true
      assert users.teilnahmebedingungen == true
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Anmeldung.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      update_attrs = %{vorname: "some updated vorname", nachname: "some updated nachname", straße: "some updated straße", hausnummer: 43, plz: 43, stadt: "some updated stadt", email: "some updated email", telefon_festnetz: "some updated telefon_festnetz", telefon_handy: "some updated telefon_handy", erreichbar: "some updated erreichbar", vorname_kind: "some updated vorname_kind", nachname_kind: "some updated nachname_kind", geburtstag: ~D[2024-08-29], instrument: "some updated instrument", allergien: false, schwimmer: :nichtschwimmer, essen: :vegetarisch, kommentar: "some updated kommentar", fotos: :nichtveroeffentlicht, persoenliches_gespraech: false, teilnahmebedingungen: false}

      assert {:ok, %Users{} = users} = Anmeldung.update_users(users, update_attrs)
      assert users.vorname == "some updated vorname"
      assert users.nachname == "some updated nachname"
      assert users.straße == "some updated straße"
      assert users.hausnummer == 43
      assert users.plz == 43
      assert users.stadt == "some updated stadt"
      assert users.email == "some updated email"
      assert users.telefon_festnetz == "some updated telefon_festnetz"
      assert users.telefon_handy == "some updated telefon_handy"
      assert users.erreichbar == "some updated erreichbar"
      assert users.vorname_kind == "some updated vorname_kind"
      assert users.nachname_kind == "some updated nachname_kind"
      assert users.geburtstag == ~D[2024-08-29]
      assert users.instrument == "some updated instrument"
      assert users.allergien == false
      assert users.schwimmer == :nichtschwimmer
      assert users.essen == :vegetarisch
      assert users.kommentar == "some updated kommentar"
      assert users.fotos == :nichtveroeffentlicht
      assert users.persoenliches_gespraech == false
      assert users.teilnahmebedingungen == false
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Anmeldung.update_users(users, @invalid_attrs)
      assert users == Anmeldung.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Anmeldung.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Anmeldung.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Anmeldung.change_users(users)
    end
  end
end
