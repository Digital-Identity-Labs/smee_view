defmodule SmeeView.Registration do

  @moduledoc """
  This module can extracts the `<mdrpi:RegistrationInfo>` elements in entity metadata as "aspect" structs, and then
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

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Registration, roles: false, one: true

  @entity_xmap [
    ~x"//md:Extensions/mdrpi:RegistrationInfo"le,
    authority: ~x"string(@registrationAuthority)"s,
    instant: ~x"string(@registrationInstant)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  defp cascade_views(entity, data, role) do
    Map.merge(data, %{
      policies: SmeeView.RegistrationPolicies.view(entity, :all)
    })
  end

end
