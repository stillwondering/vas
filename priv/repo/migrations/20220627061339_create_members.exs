defmodule VAS.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :first_name, :string
      add :last_name, :string
      add :date_of_birth, :date
      add :email, :string
      add :mobile, :string
      add :street, :string
      add :zip_code, :string
      add :city, :string

      timestamps()
    end
  end
end
