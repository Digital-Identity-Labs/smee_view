defmodule SmeeView.Aspects.Logo do

  @moduledoc """
  Represents and processes <mdui:Logo> elements in entity metadata as Aspect structs.

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
  Returns the shape of the logo (:square, :portrait or :landscape)

  It's currently rather crude - only *exact* squares will return `:square`

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.shape(aspect)
  # => :landscape
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
  Returns the size of the logo as a word. These words are currently arbitrary, from an old application

  Sizes are: :tiny, :small, :icon, :default, :medium, :large, :huge and :silly

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.size(aspect)
  # => :large
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
  Returns the total number of pixels (X x Y)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.pixels(aspect)
  # => 4096
  ```
  """
  @spec pixels(aspect :: __MODULE__.t()) :: integer()
  def pixels(logo) do
    logo.width * logo.height
  end

  @doc """
  Does the logo use a HTTPS URL?

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.tls?(aspect)
  # => false
  ```
  """
  @spec tls?(aspect :: __MODULE__.t()) :: boolean()
  def tls?(logo) do
    String.starts_with?(String.downcase(logo.url), "https:")
  end

  @doc """
  Is the URL a `data:` URL containing the actual logo, rather than a normal HTTP address?

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.data?(aspect)
  # => true
  ```
  """
  @spec data?(aspect :: __MODULE__.t()) :: boolean()
  def data?(logo) do
    String.starts_with?(String.downcase(logo.url), "data:")
  end

  @doc """
  Returns the file format of the image, if known, based on the URL

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.format(aspect)
  # => :png
  ```
  """
  @spec format(aspect :: __MODULE__.t()) :: atom()
  def format(%{url: "data:" <> _} = logo) do
    String.split(logo.url, ";")
    |> List.first()
    |> case do
         "data:image/jpeg" -> :jpeg
         "data:image/jpg" -> :jpeg
         "data:image/png" -> :png
         "data:image/gif" -> :gif
         "data:image/avif" -> :avif
         "data:image/svg+xml" -> :svg
         "data:image/webp" -> :webp
         _ -> :unknown
       end
  end

  def format(logo) do
    case String.downcase(Path.extname(logo.url)) do
      ".jpg" -> :jpeg
      ".jpeg" -> :jpeg
      ".png" -> :png
      ".gif" -> :gif
      ".svg" -> :svg
      ".avif" -> :avif
      ".webp" -> :webp
      _ -> :unknown
    end
  end

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data, options \\ []) do
    Map.merge(
      data,
      %{
        height: Utils.normalize_index(data[:height]),
        width: Utils.normalize_index(data[:width]),
      }
    )
  end

end

defimpl String.Chars, for: SmeeView.Aspects.Logo do
@moduledoc false
  def to_string(a), do: a.url
end
