defmodule SmeeView.Aspects.Null do

  @moduledoc false

  alias __MODULE__

  @type t :: %__MODULE__{
               text: binary()
             }

  @derive Jason.Encoder
  defstruct [
    text: ""
  ]

  use SmeeView.Aspects.AspectCommon

  ## Workaround, plan to remove
  def binding(aspect) do
    nil
  end

  #######################################################################################

  defp prepare_data(_data, _options \\ []) do
    []
  end


end

defimpl String.Chars, for: SmeeView.Aspects.Null do
  def to_string(a), do: ""
end
