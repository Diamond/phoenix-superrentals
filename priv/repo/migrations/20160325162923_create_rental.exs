defmodule Superrentals.Repo.Migrations.CreateRental do
  use Ecto.Migration

  def change do
    create table(:rentals) do
      add :title, :string
      add :owner, :string
      add :city, :string
      add :type, :string
      add :bedrooms, :integer
      add :image, :string

      timestamps
    end

  end
end
