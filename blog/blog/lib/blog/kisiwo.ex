defmodule Blog.Kisiwo do
  @moduledoc """
  The Kisiwo context.
  """

  import Ecto.Query, warn: false
  alias Blog.Repo

  alias Blog.Kisiwo.Anmeldung

  @doc """
  Returns the list of anmeldung.

  ## Examples

      iex> list_anmeldung()
      [%Anmeldung{}, ...]

  """
  def list_anmeldung do
    Repo.all(Anmeldung)
  end

  @doc """
  Gets a single anmeldung.

  Raises `Ecto.NoResultsError` if the Anmeldung does not exist.

  ## Examples

      iex> get_anmeldung!(123)
      %Anmeldung{}

      iex> get_anmeldung!(456)
      ** (Ecto.NoResultsError)

  """
  def get_anmeldung!(id), do: Repo.get!(Anmeldung, id)

  @doc """
  Creates a anmeldung.

  ## Examples

      iex> create_anmeldung(%{field: value})
      {:ok, %Anmeldung{}}

      iex> create_anmeldung(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_anmeldung(attrs \\ %{}) do
    %Anmeldung{}
    |> Anmeldung.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a anmeldung.

  ## Examples

      iex> update_anmeldung(anmeldung, %{field: new_value})
      {:ok, %Anmeldung{}}

      iex> update_anmeldung(anmeldung, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_anmeldung(%Anmeldung{} = anmeldung, attrs) do
    anmeldung
    |> Anmeldung.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a anmeldung.

  ## Examples

      iex> delete_anmeldung(anmeldung)
      {:ok, %Anmeldung{}}

      iex> delete_anmeldung(anmeldung)
      {:error, %Ecto.Changeset{}}

  """
  def delete_anmeldung(%Anmeldung{} = anmeldung) do
    Repo.delete(anmeldung)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking anmeldung changes.

  ## Examples

      iex> change_anmeldung(anmeldung)
      %Ecto.Changeset{data: %Anmeldung{}}

  """
  def change_anmeldung(%Anmeldung{} = anmeldung, attrs \\ %{}) do
    Anmeldung.changeset(anmeldung, attrs)
  end
end
