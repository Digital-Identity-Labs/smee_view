defmodule SmeeView.ArtifactResolutionServices do

  @moduledoc """
  List all any <ArtifactResolutionService> elements in entity metadata as ArtifactResolutionService aspects.

  """

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.ArtifactResolutionService, roles: false, features: [:endpoint]

  @entity_xmap [
    ~x"//md:IDPSSODescriptor/ArtifactResolutionService"le,
    binding: ~x"string(@Binding)"s,
    location: ~x"string(@Location)"s,
    index: ~x"string(@index)"s,
  ]

  defp entity_xmap do
    @entity_xmap
  end

  #######################################################################################

end
#
