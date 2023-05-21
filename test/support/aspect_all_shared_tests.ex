defmodule AspectAllSharedTests do
  defmacro __using__(params) do

    params = Keyword.merge(
      [
        aspect: nil, # SmeeView.Aspects.Null,
        entity: nil
      ],
      params
    )

    quote do
      use ExUnit.Case

      describe "x/1" do



      end


      test "truth" do
        assert true
      end


    end
  end
end
