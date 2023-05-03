defmodule SmeeView.Aspects.AspectTools.URL do

  @moduledoc false

  alias __MODULE__
  alias SmeeView.Utils

  def url(aspect) do
    aspect.url
  end

  def valid?(aspect) do
    case URI.new(aspect.uri) do
      {:ok, _} -> true
      {:error, _} -> false
    end
  end

end
