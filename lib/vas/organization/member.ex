defmodule VAS.Organization.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :city, :string
    field :date_of_birth, :date
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :mobile, :string
    field :street, :string
    field :zip_code, :string

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [
      :first_name,
      :last_name,
      :date_of_birth,
      :email,
      :mobile,
      :street,
      :zip_code,
      :city
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :date_of_birth,
      :street,
      :zip_code,
      :city
    ])
    |> validate_length(:first_name, min: 1)
    |> validate_length(:last_name, min: 1)
  end

  def display_name(%VAS.Organization.Member{first_name: first_name, last_name: last_name}) do
    "#{String.upcase(last_name)}, #{first_name}"
  end

  def age(%VAS.Organization.Member{date_of_birth: date_of_birth}, today \\ Date.utc_today()) do
    today_in_birthday_year = Date.new!(date_of_birth.year, today.month, today.day)
    years_diff = today.year - date_of_birth.year

    age =
      if Date.compare(today_in_birthday_year, date_of_birth) == :lt do
        years_diff - 1
      else
        years_diff
      end

    if age < 0, do: 0, else: age
  end
end
