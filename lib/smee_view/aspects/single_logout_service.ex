defmodule SmeeView.Aspects.SingleLogoutService do

  alias __MODULE__
  alias SmeeView.Utils
  use SmeeView.Aspects.AspectCommon

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%SingleLogoutService{}, data)
  end

end
