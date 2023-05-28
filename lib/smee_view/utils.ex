defmodule SmeeView.Utils do

  @moduledoc false

  def normalize(value) when is_nil(value) or value == "" do
    nil
  end

  def normalize(value) when is_atom(value) or is_binary(value) do
    "#{value}"
  end

  def normalize_email("mailto:" <> email) do
    email
  end

  def normalize_email(email) do
    email
  end

  def normalize_index(index) when is_nil(index) do
    0
  end

  def normalize_index(index) when is_integer(index) do
    index
  end

  def normalize_index(index) do
    {int, _} = Integer.parse("#{index}")
    int
  end

  def default_lang() do
    Application.get_env(:smee_view, :defaultlang, "en")
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
    |> String.replace(",", " ") # Because some federations don't follow the spec and others don't fix it
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
