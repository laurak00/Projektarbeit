defmodule BlogWeb.AnmeldungLiveTest do
  use BlogWeb.ConnCase

  import Phoenix.LiveViewTest
  import Blog.KisiwoFixtures

  @create_attrs %{vorname: "some vorname", nachname: "some nachname", straße: "some straße", hausnummer: 42, plz: 42, stadt: "some stadt", email: "some email", tel_festnetz: 42, tel_handy: 42, erreichbarkeit: "some erreichbarkeit", vornameKind: "some vornameKind", nachnameKind: "some nachnameKind", geburtstag: "2024-08-27"}
  @update_attrs %{vorname: "some updated vorname", nachname: "some updated nachname", straße: "some updated straße", hausnummer: 43, plz: 43, stadt: "some updated stadt", email: "some updated email", tel_festnetz: 43, tel_handy: 43, erreichbarkeit: "some updated erreichbarkeit", vornameKind: "some updated vornameKind", nachnameKind: "some updated nachnameKind", geburtstag: "2024-08-28"}
  @invalid_attrs %{vorname: nil, nachname: nil, straße: nil, hausnummer: nil, plz: nil, stadt: nil, email: nil, tel_festnetz: nil, tel_handy: nil, erreichbarkeit: nil, vornameKind: nil, nachnameKind: nil, geburtstag: nil}

  defp create_anmeldung(_) do
    anmeldung = anmeldung_fixture()
    %{anmeldung: anmeldung}
  end

  describe "Index" do
    setup [:create_anmeldung]

    test "lists all anmeldung", %{conn: conn, anmeldung: anmeldung} do
      {:ok, _index_live, html} = live(conn, ~p"/anmeldung")

      assert html =~ "Listing Anmeldung"
      assert html =~ anmeldung.vorname
    end

    test "saves new anmeldung", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/anmeldung")

      assert index_live |> element("a", "New Anmeldung") |> render_click() =~
               "New Anmeldung"

      assert_patch(index_live, ~p"/anmeldung/new")

      assert index_live
             |> form("#anmeldung-form", anmeldung: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#anmeldung-form", anmeldung: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/anmeldung")

      html = render(index_live)
      assert html =~ "Anmeldung created successfully"
      assert html =~ "some vorname"
    end

    test "updates anmeldung in listing", %{conn: conn, anmeldung: anmeldung} do
      {:ok, index_live, _html} = live(conn, ~p"/anmeldung")

      assert index_live |> element("#anmeldung-#{anmeldung.id} a", "Edit") |> render_click() =~
               "Edit Anmeldung"

      assert_patch(index_live, ~p"/anmeldung/#{anmeldung}/edit")

      assert index_live
             |> form("#anmeldung-form", anmeldung: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#anmeldung-form", anmeldung: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/anmeldung")

      html = render(index_live)
      assert html =~ "Anmeldung updated successfully"
      assert html =~ "some updated vorname"
    end

    test "deletes anmeldung in listing", %{conn: conn, anmeldung: anmeldung} do
      {:ok, index_live, _html} = live(conn, ~p"/anmeldung")

      assert index_live |> element("#anmeldung-#{anmeldung.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#anmeldung-#{anmeldung.id}")
    end
  end

  describe "Show" do
    setup [:create_anmeldung]

    test "displays anmeldung", %{conn: conn, anmeldung: anmeldung} do
      {:ok, _show_live, html} = live(conn, ~p"/anmeldung/#{anmeldung}")

      assert html =~ "Show Anmeldung"
      assert html =~ anmeldung.vorname
    end

    test "updates anmeldung within modal", %{conn: conn, anmeldung: anmeldung} do
      {:ok, show_live, _html} = live(conn, ~p"/anmeldung/#{anmeldung}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Anmeldung"

      assert_patch(show_live, ~p"/anmeldung/#{anmeldung}/show/edit")

      assert show_live
             |> form("#anmeldung-form", anmeldung: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#anmeldung-form", anmeldung: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/anmeldung/#{anmeldung}")

      html = render(show_live)
      assert html =~ "Anmeldung updated successfully"
      assert html =~ "some updated vorname"
    end
  end
end
