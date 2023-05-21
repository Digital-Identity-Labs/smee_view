defmodule AspectTextSharedTests do
  defmacro __using__(params) do

    params = Keyword.merge(
      [
        aspect: SmeeView.Aspects.Null,
        entity: nil
      ],
      params
    )

    quote do
      use ExUnit.Case

      #@moduletag unquote(params)

      describe "text/1" do



      end


      test "truth" do
        assert true
      end


    end

    def new(options) do
      unquote(params[:aspect]).new()
    end

  end
end
