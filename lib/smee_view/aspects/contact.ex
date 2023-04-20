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
    struct(%Contact{}, data)
  end

  #######################################################################################

end
