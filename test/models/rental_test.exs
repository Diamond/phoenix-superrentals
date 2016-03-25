defmodule Superrentals.RentalTest do
  use Superrentals.ModelCase

  alias Superrentals.Rental

  @valid_attrs %{bedrooms: 42, city: "some content", image: "some content", owner: "some content", title: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Rental.changeset(%Rental{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Rental.changeset(%Rental{}, @invalid_attrs)
    refute changeset.valid?
  end
end
