defmodule SmeeView.Aspects.Contact do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools


  @types ~w(technical support administrative billing other)

  defstruct [
    email: nil,
    phone: nil,
    type: nil,
    givenname: nil,
    surname: nil,
    company: nil
  ]

  use SmeeView.Aspects.AspectCommon

  #######################################################################################

  defp prepare_data(data, options \\ []) do
    Map.merge(data, %{email: Utils.normalize_email(data[:email])})
  end

end
