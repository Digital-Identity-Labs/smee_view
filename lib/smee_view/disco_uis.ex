defmodule SmeeView.DiscoUIs do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.DiscoUI, roles: false, one: true


  @entity_xmap [
    ~x"//md:Extensions"l,
    exists: ~x"/"
  ]

  defp entity_xmap do
    @entity_xmap
  end


  defp cascade_views(entity, aspect_data, role) do
    Map.merge(
      aspect_data,
      %{
        displaynames: SmeeView.OrganizationDisplaynames.view(entity, role),
        names: SmeeView.OrganizationNames.view(entity, role),
        logos: SmeeView.Logos.view(entity, :all),
        privacy_urls: SmeeView.Domains.view(entity, :all),
        information_urls: SmeeView.Domains.view(entity, :all),
        keywords: SmeeView.Keywords.view(entity, :all),
        organization: SmeeView.Organization.view(entity, :all)
      }
    )
  end

end
