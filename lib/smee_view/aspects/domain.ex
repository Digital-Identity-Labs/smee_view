defmodule SmeeView.Aspects.Domain do

  alias __MODULE__
  alias Smee.Entity

  defstruct [
    url: nil,
    role: nil,
    height: 0,
    width: 0,
    role: nil,
    lang: "en",
    format: nil,
    shape: nil,
    size: nil,
    pixels: 0,
    tls: false,
    data: false
  ]

  def new(data, options \\ []) do
    struct(%Domain{}, data)
    |> struct(
#         lang: calc_lang(data),
#         shape: calc_shape(data),
#         format: calc_format(data),
#         size: calc_size(data),
#         pixels: calc_pixels(data),
#         tls: calc_tls(data),
#         data: calc_data(data)
       )
  end


  #######################################################################################


end
