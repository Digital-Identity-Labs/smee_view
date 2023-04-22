defmodule SmeeView.Utils do

  def parse_keywords(words) when is_nil(words) do
    []
  end

  def parse_keywords(words) when is_list(words) do
    words
  end

  def parse_keywords(words) when is_binary(words) do
    words
    |> String.split()
    |> Enum.map(fn s -> String.replace(s, "+", " ") end)
  end

  def parse_protocols(words) when is_nil(words) do
    []
  end

  def parse_protocols(words) when is_list(words) do
    words
  end

  def parse_protocols(words) when is_binary(words) do
    words
    |> String.split(" ")
  end

  def parse_boolean(value) do
    case value do
      "TRUE" -> true
      "true" -> true
      "1" -> true
      1 -> true
      _ -> false
    end
  end

  #######################################################################################

end
