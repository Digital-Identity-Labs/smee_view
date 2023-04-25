defmodule SmeeView.Aspects.Domain do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools


  use SmeeView.Aspects.AspectCommon

  defstruct [
    domain: nil
  ]

  def new(data, options \\ []) do
    struct(%Domain{}, data)
  end

  #######################################################################################


end

defimpl String.Chars, for: SmeeView.Aspects.Domain do
  def to_string(d), do: d.domain
end
