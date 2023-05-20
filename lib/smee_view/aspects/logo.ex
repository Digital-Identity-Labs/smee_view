defmodule SmeeView.Aspects.Logo do

  @moduledoc """
  Represents and processes <> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils
  @type t :: %__MODULE__{
               url: binary(),
               role: atom(),
               height: integer(),
               width: integer(),
               lang: binary(),
             }

  @derive Jason.Encoder
  defstruct [
    url: nil,
    role: nil,
    height: 0,
    width: 0,
    lang: "en",
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :url], roles: true

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec shape(aspect :: __MODULE__.t()) :: atom()
  def shape(logo) do
    height = logo.height
    width = logo.width
    cond do
      Enum.member?(75..85, width) && Enum.member?(55..65, height) -> "default"
      width == height -> :square
      width < height -> :portrait
      width > height -> :landscape
    end
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec size(aspect :: __MODULE__.t()) :: atom()
  def size(logo) do
    pixels = pixels(logo)
    cond do
      pixels <= (16 * 16) -> :tiny
      pixels <= (32 * 32) -> :small
      pixels <= (64 * 64) -> :icon
      Enum.member?(4200..6200, pixels) -> :default
      pixels <= (128 * 128) -> :medium
      pixels <= (256 * 256) -> :large
      pixels <= (512 * 512) -> :huge
      true -> :silly
    end
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec pixels(aspect :: __MODULE__.t()) :: integer()
  def pixels(logo) do
    logo.width * logo.height
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec tls?(aspect :: __MODULE__.t()) :: boolean()
  def tls?(logo) do
    String.starts_with?(String.downcase(logo.url), "https:")
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec data?(aspect :: __MODULE__.t()) :: boolean()
  def data?(logo) do
    String.starts_with?(String.downcase(logo.url), "data:")
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec format(aspect :: __MODULE__.t()) :: atom()
  def format(logo) do
    case String.downcase(Path.extname(logo.url)) do
      ".jpg" -> :jpeg
      ".jpeg" -> :jpeg
      ".png" -> :png
      ".avif" -> :avif
      ".webp" -> :webp
      _ -> :uknown
    end
  end

  #######################################################################################


end

defimpl String.Chars, for: SmeeView.Aspects.Logo do
  def to_string(a), do: a.url
end
