defmodule Blog.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :name, :string
    field :price, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
