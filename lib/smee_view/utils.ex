defmodule SmeeView.Utils do

  @moduledoc false

  def normalize(value) when is_nil(value) or value == "" do
    nil
  end

  def normalize(value) when is_atom(value) or is_binary(value) do
    "#{value}"
  end

  def default_lang() do
    "en"
  end

  def fallback_lang() do
    "en"
  end

  def default_text() do
    ""
  end

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
