defmodule SmeeView.Aspects.Domain do

  alias __MODULE__
  alias Smee.Entity

  def new(data, options \\ []) do
    "#{data[:domain]}"
  end

  #######################################################################################


end
