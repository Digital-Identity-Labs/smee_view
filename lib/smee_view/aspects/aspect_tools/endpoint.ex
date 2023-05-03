defmodule SmeeView.Aspects.AspectTools.Endpoint do

  @moduledoc false

  alias __MODULE__
  alias SmeeView.Utils

  def url(aspect) do
    aspect.location
  end

  def valid?(aspect) do
    case URI.new(aspect.location) do
      {:ok, _} -> true
      {:error, _} -> false
    end
  end

#  def available?(aspect) do
  #    # Hmm
  #  end

end
