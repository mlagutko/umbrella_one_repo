defmodule Contacts.Schema.Contact do
  @moduledoc false
  use Db.Schema

  import Ecto.Changeset

  schema "contact" do
    field :name, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required(:name)
  end
end