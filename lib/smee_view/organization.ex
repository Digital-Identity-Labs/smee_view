defmodule SmeeView.Organization do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Organization, roles: false, one: true

  @entity_xmap [
    ~x"//md:Organization"l,
    exists: ~x"/"
  ]

  defp entity_xmap do
    @entity_xmap
  end
  
  defp cascade_views(entity, data, role) do
    Map.merge(
      data,
      %{
        displaynames: SmeeView.OrganizationDisplaynames.view(entity, role),
        names: SmeeView.OrganizationNames.view(entity, role),
        urls: SmeeView.OrganizationURLs.view(entity, role)
      }
    )
  end



end
