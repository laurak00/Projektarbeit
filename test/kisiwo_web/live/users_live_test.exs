defmodule KisiwoWeb.UsersLiveTest do
  use KisiwoWeb.ConnCase

  import Phoenix.LiveViewTest
  import Kisiwo.AnmeldungFixtures

  @create_attrs %{vorname: "some vorname", nachname: "some nachname", straße: "some straße", hausnummer: 42, plz: 42, stadt: "some stadt", email: "some email", telefon_festnetz: "some telefon_festnetz", telefon_handy: "some telefon_handy", erreichbar: "some erreichbar", vorname_kind: "some vorname_kind", nachname_kind: "some nachname_kind", geburtstag: "2024-08-28", instrument: "some instrument", allergien: true, schwimmer: :schwimmer, essen: :alles, kommentar: "some kommentar", fotos: :veroeffentlicht, persoenliches_gespraech: true, teilnahmebedingungen: true}
  @update_attrs %{vorname: "some updated vorname", nachname: "some updated nachname", straße: "some updated straße", hausnummer: 43, plz: 43, stadt: "some updated stadt", email: "some updated email", telefon_festnetz: "some updated telefon_festnetz", telefon_handy: "some updated telefon_handy", erreichbar: "some updated erreichbar", vorname_kind: "some updated vorname_kind", nachname_kind: "some updated nachname_kind", geburtstag: "2024-08-29", instrument: "some updated instrument", allergien: false, schwimmer: :nichtschwimmer, essen: :vegetarisch, kommentar: "some updated kommentar", fotos: :nichtveroeffentlicht, persoenliches_gespraech: false, teilnahmebedingungen: false}
  @invalid_attrs %{vorname: nil, nachname: nil, straße: nil, hausnummer: nil, plz: nil, stadt: nil, email: nil, telefon_festnetz: nil, telefon_handy: nil, erreichbar: nil, vorname_kind: nil, nachname_kind: nil, geburtstag: nil, instrument: nil, allergien: false, schwimmer: nil, essen: nil, kommentar: nil, fotos: nil, persoenliches_gespraech: false, teilnahmebedingungen: false}

  defp create_users(_) do
    users = users_fixture()
    %{users: users}
  end

  describe "Index" do
    setup [:create_users]

    test "lists all users", %{conn: conn, users: users} do
      {:ok, _index_live, html} = live(conn, ~p"/users")

      assert html =~ "Listing Users"
      assert html =~ users.vorname
    end

    test "saves new users", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/users")

      assert index_live |> element("a", "New Users") |> render_click() =~
               "New Users"

      assert_patch(index_live, ~p"/users/new")

      assert index_live
             |> form("#users-form", users: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#users-form", users: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/users")

      html = render(index_live)
      assert html =~ "Users created successfully"
      assert html =~ "some vorname"
    end

    test "updates users in listing", %{conn: conn, users: users} do
      {:ok, index_live, _html} = live(conn, ~p"/users")

      assert index_live |> element("#users-#{users.id} a", "Edit") |> render_click() =~
               "Edit Users"

      assert_patch(index_live, ~p"/users/#{users}/edit")

      assert index_live
             |> form("#users-form", users: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#users-form", users: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/users")

      html = render(index_live)
      assert html =~ "Users updated successfully"
      assert html =~ "some updated vorname"
    end

    test "deletes users in listing", %{conn: conn, users: users} do
      {:ok, index_live, _html} = live(conn, ~p"/users")

      assert index_live |> element("#users-#{users.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#users-#{users.id}")
    end
  end

  describe "Show" do
    setup [:create_users]

    test "displays users", %{conn: conn, users: users} do
      {:ok, _show_live, html} = live(conn, ~p"/users/#{users}")

      assert html =~ "Show Users"
      assert html =~ users.vorname
    end

    test "updates users within modal", %{conn: conn, users: users} do
      {:ok, show_live, _html} = live(conn, ~p"/users/#{users}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Users"

      assert_patch(show_live, ~p"/users/#{users}/show/edit")

      assert show_live
             |> form("#users-form", users: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#users-form", users: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/users/#{users}")

      html = render(show_live)
      assert html =~ "Users updated successfully"
      assert html =~ "some updated vorname"
    end
  end
end
