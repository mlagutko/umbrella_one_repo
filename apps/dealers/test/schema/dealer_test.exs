defmodule Dealers.Schema.ContactTest do
  use Dealers.DataCase

  alias Dealers.Schema.Dealer

  @valid_attrs %{
    name: "John Doe"
  }

  @invalid_attrs %{name: nil}

  test "create_contact/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = create_contact(@invalid_attrs)
  end

  test "create_dealer/1 with valid data creates a dealer" do
    assert {:ok, %Dealer{} = model} = create_contact(@valid_attrs)
    assert model.name == @valid_attrs.name
  end

  defp create_contact(attrs) do
    %Dealer{}
    |> Dealer.changeset(attrs)
    |> Repo.insert()
  end
end