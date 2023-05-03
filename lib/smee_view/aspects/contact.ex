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

  def new(data, options \\ []) do
    data = Map.merge(data, %{email: normalize_email(data[:email])})
    struct(%Contact{}, data)
  end


  #######################################################################################

  defp normalize_email(email) do
    email
    |> String.replace_leading("mailto:", "")
  end

end
