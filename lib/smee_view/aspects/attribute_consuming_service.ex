defmodule SmeeView.Aspects.AttributeConsumingService do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools

  defstruct [
    default: false,
    index: nil,
    requested_attributes: [],
    service_descriptions: [],
    service_names: []
  ]

  use SmeeView.Aspects.AspectCommon

end
