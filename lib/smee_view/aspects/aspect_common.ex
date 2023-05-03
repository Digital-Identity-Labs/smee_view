defmodule SmeeView.Aspects.AspectCommon do

  @moduledoc false

  alias SmeeView.Utils

  defmacro __using__(_params) do
    quote do

      def composite?(aspect) do
        false
      end


      #######################################################################################

      defoverridable [composite?: 1]


    end
  end






end
