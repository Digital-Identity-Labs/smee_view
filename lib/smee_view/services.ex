defmodule SmeeView.Services do

  def view(entity, role \\ :all, options \\ []) do
    [
      SmeeView.ArtifactResolutionServices.view(entity, role, options),
      SmeeView.AssertionConsumerServices.view(entity, role, options),
      SmeeView.AssertionIDRequestServices.view(entity, role, options),
      SmeeView.AttributeConsumingServices.view(entity, role, options),
      SmeeView.AttributeServices.view(entity, role, options),
      SmeeView.ManageNameidServices.view(entity, role, options),
      SmeeView.NameidMappingServices.view(entity, role, options),
      SmeeView.SingleLogoutServices.view(entity, role, options),
      SmeeView.SingleSignonServices.view(entity, role, options)
    ]
    |> List.flatten()
  end

  #######################################################################################



end
