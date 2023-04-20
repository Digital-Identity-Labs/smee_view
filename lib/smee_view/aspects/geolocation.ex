defmodule SmeeView.Aspects.Geolocation do

  alias __MODULE__
  alias Smee.Entity

  def new(data, options \\ []) do
    "#{data[:geolocation]}"
  end

  #######################################################################################


end
