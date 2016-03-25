# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Superrentals.Repo.insert!(%Superrentals.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Superrentals.Repo
alias Superrentals.Rental

%Rental{
  title: "Grand Old Mansion",
  owner: "Veruca Salt",
  city: "San Francisco",
  type: "Estate",
  bedrooms: 15,
  image: "https://upload.wikimedia.org/wikipedia/commons/c/cb/Crane_estate_(5).jpg"
} |> Repo.insert!

%Rental{
  title: "Urban Living",
  owner: "Mike Teavee",
  city: "Seattle",
  type: "Condo",
  bedrooms: 1,
  image: "https://upload.wikimedia.org/wikipedia/commons/0/0e/Alfonso_13_Highrise_Tegucigalpa.jpg"
} |> Repo.insert!

%Rental{
  title: "Downtown Charm",
  owner: "Violet Beauregarde",
  city: "Portland",
  type: "Apartment",
  bedrooms: 3,
  image: "https://upload.wikimedia.org/wikipedia/commons/f/f7/Wheeldon_Apartment_Building_-_Portland_Oregon.jpg"
} |> Repo.insert!
