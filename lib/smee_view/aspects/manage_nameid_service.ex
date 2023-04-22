defmodule SmeeView.Aspects.ManageNameidService do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%ManageNameidService{}, data)
  end

end
