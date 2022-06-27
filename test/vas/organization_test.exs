defmodule VAS.OrganizationTest do
  use VAS.DataCase

  alias VAS.Organization

  describe "members" do
    alias VAS.Organization.Member

    import VAS.OrganizationFixtures

    @invalid_attrs %{city: nil, date_of_birth: nil, email: nil, first_name: nil, last_name: nil, mobile: nil, street: nil, zip_code: nil}

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Organization.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Organization.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      valid_attrs = %{city: "some city", date_of_birth: ~D[2022-06-26], email: "some email", first_name: "some first_name", last_name: "some last_name", mobile: "some mobile", street: "some street", zip_code: "some zip_code"}

      assert {:ok, %Member{} = member} = Organization.create_member(valid_attrs)
      assert member.city == "some city"
      assert member.date_of_birth == ~D[2022-06-26]
      assert member.email == "some email"
      assert member.first_name == "some first_name"
      assert member.last_name == "some last_name"
      assert member.mobile == "some mobile"
      assert member.street == "some street"
      assert member.zip_code == "some zip_code"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      update_attrs = %{city: "some updated city", date_of_birth: ~D[2022-06-27], email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", mobile: "some updated mobile", street: "some updated street", zip_code: "some updated zip_code"}

      assert {:ok, %Member{} = member} = Organization.update_member(member, update_attrs)
      assert member.city == "some updated city"
      assert member.date_of_birth == ~D[2022-06-27]
      assert member.email == "some updated email"
      assert member.first_name == "some updated first_name"
      assert member.last_name == "some updated last_name"
      assert member.mobile == "some updated mobile"
      assert member.street == "some updated street"
      assert member.zip_code == "some updated zip_code"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_member(member, @invalid_attrs)
      assert member == Organization.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Organization.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Organization.change_member(member)
    end
  end
end
