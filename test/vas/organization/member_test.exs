defmodule VAS.Organization.MemberTest do
  use VAS.DataCase

  alias VAS.Organization.Member

  import VAS.OrganizationFixtures

  test "display_name/1 returns correct name" do
    member = member_fixture()
    assert Member.display_name(member) == "SOME LAST_NAME, some first_name"
  end

  test "age/2 returns correct age" do
    member = %Member{date_of_birth: Date.new!(1997, 3, 11)}

    assert Member.age(member, Date.new!(1990, 3, 11)) == 0
    assert Member.age(member, Date.new!(2022, 2, 11)) == 24
    assert Member.age(member, Date.new!(2022, 3, 11)) == 25
    assert Member.age(member, Date.new!(2022, 6, 27)) == 25
  end
end
