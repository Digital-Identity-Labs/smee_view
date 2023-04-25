defmodule SmeeView.Entity do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Entity, roles: false, one: true

  @entity_xmap [
    ~x"//md:EntityDescriptor"el,
    valid_until: ~x"string(@validUntil)"s,
    entity_id: ~x"string(@entityID)"s,
    id: ~x"string(@ID)"s,
    cache_duration: ~x"string(@cacheDuration)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  defp cascade_views(entity, aspect_data, role) do

    Map.merge(
      aspect_data,
      %{
        registration: SmeeView.Registration.view(entity, :all),
        publications: SmeeView.PublicationPath.view(entity, :all),
        idp: SmeeView.IdP.view(entity, :idp),
        sp: SmeeView.SP.view(entity, :sp),
        organization: SmeeView.Organization.view(entity, :all),
        contacts: SmeeView.Contacts.view(entity, :all),
      }
    )
  end

end
