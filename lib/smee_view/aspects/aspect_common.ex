defmodule SmeeView.Aspects.AspectCommon do

  @moduledoc false

  alias __MODULE__
  alias SmeeView.Utils

  defmacro __using__(_params) do
    quote do

      def new(data, options \\ []) do
        struct(%__MODULE__{}, prepare_data(data, options))
      end


      def composite?(aspect) do
        false
      end


      #######################################################################################

      defp prepare_data(data, options \\ []) do
        data
      end

      defoverridable [composite?: 1, new: 2, prepare_data: 2]


    end
  end






end
