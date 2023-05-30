defmodule SmeeView.Utils do

  @moduledoc false

  @spec normalize(value :: any()) :: binary()
  def normalize(value) when is_nil(value) or value == "" do
    nil
  end

  def normalize(value) when is_atom(value) or is_binary(value) or is_integer(value) do
    "#{value}"
  end

  @spec normalize_email(email :: binary()) :: binary()
  def normalize_email("mailto:" <> email) do
    email
  end

  def normalize_email(email) do
    email
  end

  @spec normalize_index(index :: binary() | atom() | integer()) :: integer()
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

  @spec default_lang() :: binary()
  def default_lang() do
    Application.get_env(:smee_view, :defaultlang, "en")
  end

  @spec fallback_lang() :: binary()
  def fallback_lang() do
    "en"
  end

  def default_text() do
    ""
  end

  @spec parse_keywords(words :: nil | binary() | list()) :: list()
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

  @spec parse_protocols(words :: nil | binary() | list()) :: list()
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

  @spec parse_boolean(value :: binary() | integer() | nil | boolean()) :: boolean()
  def parse_boolean(value) do
    case value do
      "TRUE" -> true
      "true" -> true
      "1" -> true
      1 -> true
      nil -> false
      "" -> false
      false -> false
      true -> true
      _ -> false
    end
  end

  @spec extract_data_from_xml(xdoc :: any(), xmap :: keyword()) :: map() | keyword()
  def extract_data_from_xml(xdoc, xmap) do
    if Enum.all?(Keyword.values(xmap), fn v -> is_nil(v) end) do
      [all: []]
    else
      SweetXml.xmap(xdoc, xmap)
    end
  end

  @spec parse_attr_values(values :: list()) :: list()
  def parse_attr_values(values) do
    values
    |> List.wrap()
    |> Enum.reject(fn v -> v == "" || is_nil(v) end)
    |> List.flatten()
  end

  #######################################################################################

end
