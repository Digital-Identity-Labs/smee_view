defmodule SmeeView.Aspects.Logo do

  alias __MODULE__
  alias SmeeView.Utils
  @type t :: %__MODULE__{
               url: binary(),
               role: atom(),
               height: integer(),
               width: integer(),
               lang: binary(),
             }

  defstruct [
    url: nil,
    role: nil,
    height: 0,
    width: 0,
    lang: "en",
  ]

  use SmeeView.Aspects.AspectCommon, features: [:lang, :url], roles: true

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

  def pixels(logo) do
    logo.width * logo.height
  end

  def tls?(logo) do
    String.starts_with?(String.downcase(logo.url), "https:")
  end

  def data?(logo) do
    String.starts_with?(String.downcase(logo.url), "data:")
  end

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
