defmodule SmeeView.Entities do

  @moduledoc """
  This module can extracts the `<ArtifactResolutionService>` elements in entity metadata as "aspect" structs, and then
  process and filter the results.

  Aspects can be extracted with three functions:

  * Views, via `view/2` are lists of aspects
  * Prisms, via `prism/2` are maps of entity IDs to views
  * There is also `view_one/2` which returns the first aspect of one entity

  Aspects can be extracted from `Smee.Metadata` structs, `Smee.Entity` structs, or lists of aspects, Metadata and Entity
    structs.

  The other functions in this module are intended to be applied to collections of aspect structs - for working with
    individual aspects, please look at the appropriate Aspect module.
  """

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
        entity_attributes: SmeeView.EntityAttributes.view(entity, :all),
        idps: SmeeView.IdPs.view(entity, :idp),
        sps: SmeeView.SPs.view(entity, :sp),
        organizations: SmeeView.Organizations.view(entity, :all),
        contacts: SmeeView.Contacts.view(entity, :all),
      }
    )
  end

end
