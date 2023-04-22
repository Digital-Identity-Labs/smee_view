defmodule SmeeView.Aspects.AttributeConsumingService do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    default: false,
    index: nil,
    requested_attributes: [],
    service_descriptions: [],
    service_names: []
  ]

  def new(data, options \\ []) do
    struct(%AttributeConsumingService{}, data)
  end

end
