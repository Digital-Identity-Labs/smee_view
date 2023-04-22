defmodule SmeeView.Aspects.AspectCommon do

  alias SmeeView.Utils

  defmacro __using__(_params) do
    quote do


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
