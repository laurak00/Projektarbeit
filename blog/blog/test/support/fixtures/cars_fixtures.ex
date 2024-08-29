defmodule Blog.CarsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blog.Cars` context.
  """

  @doc """
  Generate a car.
  """
  def car_fixture(attrs \\ %{}) do
    {:ok, car} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: 42
      })
      |> Blog.Cars.create_car()

    car
  end
end
