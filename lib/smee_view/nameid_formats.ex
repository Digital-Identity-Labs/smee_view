defmodule SmeeView.NameIDFormats do

  @moduledoc """
  This module can extracts the `<NameIDFormat>` elements in entity metadata as "aspect" structs, and then
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

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.NameIDFormat, roles: false

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/NameIDFormat"le,
    uri: ~x"./text()"s
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
