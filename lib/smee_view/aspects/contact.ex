defmodule SmeeView.Aspects.Contact do

  @moduledoc """
  Represents and processes <ContactPerson> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """


  alias SmeeView.Utils

  #@types ~w(technical support administrative billing other)

  @type t :: %__MODULE__{
               email: binary(),
               phone: binary(),
               type: binary(),
               rtype: binary(),
               givenname: binary(),
               surname: binary(),
               company: binary()
             }

  @derive Jason.Encoder
  defstruct [
    email: nil,
    phone: nil,
    type: nil,
    rtype: nil,
    givenname: nil,
    surname: nil,
    company: nil
  ]

  use SmeeView.Aspects.AspectCommon

  @doc """
  Returns the suggested display name of a contact, derived from given name, surname and company.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.displayname(contact)
  # => "Ponder Stibbons (Unseen University)"
  ```
  """
  @spec displayname(aspect :: __MODULE__.t()) :: binary()
  def displayname(contact) do
    name = [contact.givenname, contact.surname]
           |> Enum.join(" ")
           |> String.trim()

    if is_nil(contact.company), do: name, else: "#{name} (#{contact.company})"

  end

  @doc """
  Returns the email address and name in RFC5322 name-addr format (name <address@domain>)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.name_addr(contact)
  # => "Ponder Stibbons <ponders@unseen.edu>"
  ```
  """
  @spec name_addr(aspect :: __MODULE__.t()) :: binary()
  def name_addr(contact) do
    "\"#{displayname(contact)}\" <#{contact.email}>"
  end

  @doc """
  Returns the contact's email address as a URL (as it's stored in the metadata, probably)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.email_url(contact)
  # => "mailto:ponders@unseen.edu"
  ```
  """
  @spec email_url(aspect :: __MODULE__.t()) :: binary() | nil
  def email_url(contact) do
    "mailto:#{contact.email}"
  end

  @doc """
  Returns the phone number of the contact (or nil) as a URL, as it probably isn't stored in the metadata

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.phone_url(contact)
  # => "tel:01632960808"
  ```
  """
  @spec phone_url(aspect :: __MODULE__.t()) :: binary() | nil
  def phone_url(contact) do
    "tel:#{contact.phone}"
  end

  @doc """
  Returns the contact type (technical, support, administrative, billing, or other)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.type(contact)
  # => "administrative"
  ```
  """
  @spec type(aspect :: __MODULE__.t()) :: binary()
  def type(contact) do
    if contact.rtype do
      if contact.rtype == "http://refeds.org/metadata/contactType/security" do
        "#{contact.type}/security (Sirtfi)"
      else
        "#{contact.type}/#{contact.rtype}"
      end
    else
      contact.type
    end
  end

  @doc """
  Returns the email address as a bare email address (without name, not a URL)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.email(contact)
  # => "ponders@unseen.edu"
  ```
  """
  @spec email(aspect :: __MODULE__.t()) :: binary() | nil
  def email(contact) do
    contact.email
  end

  @doc """
  Returns the contact's givenname, if present

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.givenname(contact)
  # => "Ponder"
  ```
  """
  @spec givenname(aspect :: __MODULE__.t()) :: binary() | nil
  def givenname(contact) do
    contact.givenname
  end

  @doc """
  Returns the surname of the contact, if present.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.surname(contact)
  # => "Stibbons"
  ```
  """
  @spec surname(aspect :: __MODULE__.t()) :: binary() | nil
  def surname(contact) do
    contact.surname
  end

  @doc """
  Returns the phone number of the contact, if present.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.phone(contact)
  # => "01632960808"
  ```
  """
  @spec phone(aspect :: __MODULE__.t()) :: binary() | nil
  def phone(contact) do
    contact.phone
  end

  @doc """
  Returns the company name, if present (it probably isn't!)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.company(aspect)
  # => "Unseen University"
  ```
  """
  @spec company(aspect :: __MODULE__.t()) :: binary() | nil
  def company(contact) do
    contact.company
  end

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data) do
    Map.merge(data, %{email: Utils.normalize_email(data[:email])})
  end

end

