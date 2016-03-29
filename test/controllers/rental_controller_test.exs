defmodule Superrentals.RentalControllerTest do
  use Superrentals.ConnCase

  alias Superrentals.Rental
  @valid_attrs %{bedrooms: 42, city: "some content", image: "some content", owner: "some content", title: "some content", type: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, rental_path(conn, :index)
    assert json_response(conn, 200)["rentals"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    rental = Repo.insert! %Rental{}
    conn = get conn, rental_path(conn, :show, rental)
    assert json_response(conn, 200)["rental"] == %{"id" => rental.id,
      "title" => rental.title,
      "owner" => rental.owner,
      "city" => rental.city,
      "type" => rental.type,
      "bedrooms" => rental.bedrooms,
      "image" => rental.image}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, rental_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, rental_path(conn, :create), rental: @valid_attrs
    assert json_response(conn, 201)["rental"]["id"]
    assert Repo.get_by(Rental, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, rental_path(conn, :create), rental: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    rental = Repo.insert! %Rental{}
    conn = put conn, rental_path(conn, :update, rental), rental: @valid_attrs
    assert json_response(conn, 200)["rental"]["id"]
    assert Repo.get_by(Rental, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    rental = Repo.insert! %Rental{}
    conn = put conn, rental_path(conn, :update, rental), rental: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    rental = Repo.insert! %Rental{}
    conn = delete conn, rental_path(conn, :delete, rental)
    assert response(conn, 204)
    refute Repo.get(Rental, rental.id)
  end
end
