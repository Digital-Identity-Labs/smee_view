defmodule SmeeView.Aspects.SingleSignonService do

  alias __MODULE__
  alias SmeeView.Utils

  defstruct [
    binding: nil,
    location: nil
  ]

  def new(data, options \\ []) do
    struct(%SingleSignonService{}, data)
  end

end
