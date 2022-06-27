defmodule VASWeb.MemberView do
  use VASWeb, :view

  def display_name(%VAS.Organization.Member{} = m) do
    VAS.Organization.Member.display_name(m)
  end

  def age(%VAS.Organization.Member{} = m) do
    VAS.Organization.Member.age(m)
  end
end
