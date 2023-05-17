defmodule SmeeView.Aspects.SP do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               protocols: list(),
               authn_requests_signed: boolean(),
               want_assertions_signed: boolean(),
               logos: list(),
               displaynames: list(),
               keywords: list(),
               keys: list(),
               services: list(),
             }

  @derive Jason.Encoder
  defstruct [
    protocols: [],
    authn_requests_signed: false,
    want_assertions_signed: false,
    logos: [],
    displaynames: [],
    keywords: [],
    keys: [],
    services: []
  ]

  use SmeeView.Aspects.AspectCommon

  #######################################################################################

  @spec prepare_data(data :: map() | keyword(), options :: keyword()) :: map()
  defp prepare_data(data, options \\ []) do
    Map.merge(
      data,
      %{
        authn_requests_signed: Utils.parse_boolean(data[:authn_requests_signed]),
        want_assertions_signed: Utils.parse_boolean(data[:want_assertions_signed])
      }
    )
  end

end

defimpl String.Chars, for: SmeeView.Aspects.SP do
  def to_string(a), do: "SP"
end
