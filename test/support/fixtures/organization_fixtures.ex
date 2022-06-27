defmodule VAS.OrganizationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VAS.Organization` context.
  """

  @doc """
  Generate a member.
  """
  def member_fixture(attrs \\ %{}) do
    {:ok, member} =
      attrs
      |> Enum.into(%{
        city: "some city",
        date_of_birth: ~D[2022-06-26],
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        mobile: "some mobile",
        street: "some street",
        zip_code: "some zip_code"
      })
      |> VAS.Organization.create_member()

    member
  end
end
