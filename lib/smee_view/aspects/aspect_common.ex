defmodule SmeeView.Aspects.AspectCommon do

  @moduledoc false

  alias __MODULE__
  alias SmeeView.Utils

  defmacro __using__(params) do

    params = Keyword.merge(
      [composite: false],
      params
    ) # Make a fake generic aspect instead

    quote do

      def new(data, options \\ []) do
        struct(%__MODULE__{}, prepare_data(data, options))
      end


      def composite?() do
        unquote(params[:composite])
      end


      #######################################################################################

      defp prepare_data(data, options \\ []) do
        data
      end

      defoverridable [composite?: 0, new: 2, prepare_data: 2]


    end
  end






end
