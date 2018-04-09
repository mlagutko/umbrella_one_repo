defmodule Dealers.Schema.Dealer do
  @moduledoc false
  use Db.Schema

  import Ecto.Changeset

  schema "dealers" do
    field :name, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required(:name)
  end
end