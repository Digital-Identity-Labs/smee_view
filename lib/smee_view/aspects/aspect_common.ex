defmodule SmeeView.Aspects.AspectCommon do

  alias Smee.Entity

  defmacro __using__(_params) do
    quote do
      # idp?
      # sp?
      # language?
      # to_string
      # composite?
      # singleton?
      # best




      #######################################################################################

      defp normalize(value) when is_nil(value) or value == "" do
        nil
      end

      defp normalize(value) do
        "#{value}"
      end

     # defoverridable [normalize: 1]
    end
  end






end
