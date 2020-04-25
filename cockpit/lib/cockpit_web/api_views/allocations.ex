defmodule CockpitWeb.API.AllocationsView do
  use CockpitWeb, :view
  def render("allocation.json", %{allocation: allocation}) do
    %{
      id: allocation.id,
      prefix: allocation.cidr_prefix
    }
  end

  def render("allocations.json", %{allocations: allocations} = _params) do
    %{data: render_many(allocations, CockpitWeb.API.AllocationsView, "allocation.json", as: :allocation)}
  end
end
