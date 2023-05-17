defmodule SmeeView.Aspects.Contact do

  alias __MODULE__
  alias SmeeView.Utils

  @types ~w(technical support administrative billing other)

  @type t :: %__MODULE__{
               email: binary(),
               phone: binary(),
               type: binary(),
               givenname: binary(),
               surname: binary(),
               company: binary()
             }

  @derive Jason.Encoder
  defstruct [
    email: nil,
    phone: nil,
    type: nil,
    givenname: nil,
    surname: nil,
    company: nil
  ]

  use SmeeView.Aspects.AspectCommon

  def displayname(contact) do
    name = [contact.givenname, contact.surname]
           |> Enum.join(" ")
           |> String.trim()

    if is_nil(contact.company), do: name, else: "#{name} (#{contact.company})"

  end

  def name_addr(contact) do
    "\"#{displayname(contact)}\" <#{contact.email}>"
  end

  def email_url(contact) do
    "mailto:#{contact.email}"
  end

  def phone_url(contact) do
    "tel:#{contact.phone}"
  end

  #######################################################################################

  @spec prepare_data(data :: map() | keyword(), options :: keyword()) :: map()
  defp prepare_data(data, options \\ []) do
    Map.merge(data, %{email: Utils.normalize_email(data[:email])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.Contact do
  def to_string(a), do: SmeeView.Aspects.Contact.name_addr(a)
end
