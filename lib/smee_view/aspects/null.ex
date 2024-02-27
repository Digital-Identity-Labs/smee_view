defmodule SmeeView.Aspects.Null do

  @moduledoc false



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
  def binding(_aspect) do
    nil
  end

  #######################################################################################

  #@spec is not needed
 defp prepare_data(_data) do
    %{}
  end


end


