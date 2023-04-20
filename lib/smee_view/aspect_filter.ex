defmodule SmeeView.AspectFilter do

  def idp(enum, bool \\ true) do
    enum
    |> Stream.filter(fn e -> Entity.idp?(e) == bool end)
  end

end
