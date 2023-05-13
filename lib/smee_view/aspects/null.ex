defmodule SmeeView.Aspects.Null do

  @moduledoc false

  alias __MODULE__

  @type t :: %__MODULE__{
               text: binary()
             }

  defstruct [
    text: ""
  ]

  use SmeeView.Aspects.AspectCommon

  #######################################################################################

  defp prepare_data(_data, _options \\ []) do
    []
  end

end

defimpl String.Chars, for: SmeeView.Aspects.Null do
  def to_string(a), do: ""
end
