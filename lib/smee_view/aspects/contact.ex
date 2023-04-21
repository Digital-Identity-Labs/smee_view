defmodule SmeeView.Aspects.Contact do

  alias __MODULE__
  alias Smee.Entity

  @types ~w(technical support administrative billing other)

  defstruct [
    email: nil,
    phone: nil,
    type: nil,
    givenname: nil,
    surname: nil,
    company: nil
  ]

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
