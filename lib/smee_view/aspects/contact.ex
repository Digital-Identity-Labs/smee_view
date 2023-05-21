defmodule SmeeView.Aspects.Contact do

  @moduledoc """
  Represents and processes <Contact> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

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

  @spec displayname(aspect :: __MODULE__.t()) :: binary()
  def displayname(contact) do
    name = [contact.givenname, contact.surname]
           |> Enum.join(" ")
           |> String.trim()

    if is_nil(contact.company), do: name, else: "#{name} (#{contact.company})"

  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec name_addr(aspect :: __MODULE__.t()) :: binary()
  def name_addr(contact) do
    "\"#{displayname(contact)}\" <#{contact.email}>"
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec email_url(aspect :: __MODULE__.t()) :: binary() | nil
  def email_url(contact) do
    "mailto:#{contact.email}"
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec phone_url(aspect :: __MODULE__.t()) :: binary() | nil
  def phone_url(contact) do
    "tel:#{contact.phone}"
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec type(aspect :: __MODULE__.t()) :: binary()
  def type(contact) do
    contact.type
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec email(aspect :: __MODULE__.t()) :: binary() | nil
  def email(contact) do
    contact.email
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec givenname(aspect :: __MODULE__.t()) :: binary() | nil
  def givenname(contact) do
    contact.givenname
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec surname(aspect :: __MODULE__.t()) :: binary() | nil
  def surname(contact) do
    contact.surname
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec phone(aspect :: __MODULE__.t()) :: binary() | nil
  def phone(contact) do
    contact.phone
  end

  @doc """
  xx

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.xx(aspect)
  # => xx
  ```
  """
  @spec company(aspect :: __MODULE__.t()) :: binary() | nil
  def company(contact) do
    contact.company
  end

  #######################################################################################

  #@spec is not needed
 defp prepare_data(data, options \\ []) do
    Map.merge(data, %{email: Utils.normalize_email(data[:email])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.Contact do
  def to_string(a), do: SmeeView.Aspects.Contact.name_addr(a)
end
