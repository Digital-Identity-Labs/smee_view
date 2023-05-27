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
  @spec binding(aspect :: __MODULE__.t()) :: nil
  def binding(aspect) do
    nil
  end

  #######################################################################################

  #@spec is not needed
 defp prepare_data(_data, _options \\ []) do
    %{}
  end


end

defimpl String.Chars, for: SmeeView.Aspects.Null do
@moduledoc false
  def to_string(a), do: ""
end
