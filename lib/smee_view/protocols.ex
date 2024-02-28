defmodule SmeeView.Protocols do

  @moduledoc """
  This module can extracts the `protocolSupportEnumeration` elements in entity metadata as "aspect" structs, and then
  process and filter the results.

  Aspects can be extracted with three functions:

  * Views, via `view/3` are lists of aspects
  * Prisms, via `prism/3` are maps of entity IDs to views
  * There is also `view_one/3` which returns the first aspect found

  Aspects can be extracted from `Smee.Metadata` structs, `Smee.Entity` structs, or lists of aspects, Metadata and Entity
    structs.

  The other functions in this module are intended to be applied to collections of aspect structs - for working with
    individual aspects, please look at the appropriate Aspect module.
  """

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Protocol, roles: true

  @idp_xmap [
    ~x"//md:IDPSSODescriptor"l,
    uri: ~x"string(@protocolSupportEnumeration)"s,
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor"l,
    uri: ~x"string(@protocolSupportEnumeration)"s,
  ]

  defp idp_xmap do
    @idp_xmap
  end

  defp sp_xmap do
    @sp_xmap
  end

  #######################################################################################

  defp preprocess(role, combined_protocols) do
    new_protocols = combined_protocols
                    |> Enum.map(fn cp -> split_protocols(cp) end)
                    |> List.flatten()
    {role, new_protocols}
  end

  @spec split_protocols(data :: map()) :: map()
  defp split_protocols(%{uri: joined_protocols}) do
    joined_protocols
    |> String.split()
    |> Enum.map(fn protocol -> %{uri: protocol} end)
  end

  defp split_protocols(whatever) do
    whatever
  end

end
