defmodule AspectFixtures do

  @moduledoc false

  def fixtures(aspect_module, data_list) do
    data_list
    |> Enum.map(fn data_item -> apply(aspect_module, :new, [data_item]) end)
  end

end
