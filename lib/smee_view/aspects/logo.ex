defmodule SmeeView.Aspects.Logo do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    url: nil,
    role: nil,
    height: 0,
    width: 0,
    role: :sp,
    lang: "en",
    format: nil,
    shape: nil,
    size: nil,
    pixels: 0,
    tls: false,
    data: false
  ]

  def new(data, options \\ []) do
    struct(%Logo{}, data)
    |> struct(
         lang: calc_lang(data),
         shape: calc_shape(data),
         format: calc_format(data),
         size: calc_size(data),
         pixels: calc_pixels(data),
         tls: calc_tls(data),
         data: calc_data(data)
       )
  end

  #######################################################################################

  defp calc_lang(data) do
    case data[:lang] do
      nil -> default_lang()
      "" -> default_lang()
      otherwise -> otherwise
    end
  end

  defp calc_shape(details) do
    height = details[:height]
    width = details[:width]
    cond do
      Enum.member?(75..85, width) && Enum.member?(55..65, height) -> "default"
      width == height -> :square
      width < height -> :portrait
      width > height -> :landscape
    end
  end

  defp calc_size(details) do
    pixels = calc_pixels(details)
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

  defp calc_pixels(details) do
    details[:width] * details[:height]
  end

  defp calc_tls(details) do
    String.starts_with?(String.downcase(details[:url]), "https:")
  end

  defp calc_data(details) do
    String.starts_with?(String.downcase(details[:url]), "data:")
  end

  defp calc_format(details) do
    case String.downcase(Path.extname(details[:url])) do
      ".jpg" -> :jpeg
      ".jpeg" -> :jpeg
      ".png" -> :png
      ".avif" -> :avif
      ".webp" -> :webp
      _ -> :uknown
    end
  end

  defp default_lang() do
    "en"
  end

end
