defmodule SmeeView.Entities do

  @moduledoc """
  This module can extract a bundle of related aspects from entity metadata. It is the top-level structure for SmeeView,
    and contains all other aspects - as such it is the slowest and least efficient. If you only need a few types of data
    please use the dedicated modules for each instead of the module.

  Aspects can be extracted with three functions:

  * Views, via `view/3` are lists of aspects
  * Prisms, via `prism/3` are maps of entity IDs to views
  * There is also `view_one/3` which returns the first aspect found

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

  #########################################################################

  defp entity_xmap do
    @entity_xmap
  end

  defp cascade_views(entity, aspect_data, _role) do

    if entity.uri != aspect_data[:entity_id], do: raise "Entity ID mismatch!"

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
    |> Map.merge(
         %{
           entity_id_hash: entity.uri_hash,
           valid_until: entity.valid_until,
           modified_at: entity.modified_at,
           downloaded_at: entity.downloaded_at,
           priority: entity.priority,
           trustiness: entity.trustiness,
           tags: entity.tags,
           label: entity.label,
          # id: entity.id
         }
       )
  end

end
