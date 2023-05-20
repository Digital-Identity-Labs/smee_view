defmodule SmeeView.Aspects.Key do

  @moduledoc """
  Represents and processes <> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               type: atom(),
               pem: binary(),
               use: atom(),
               role: atom()
             }


  @pem_header "-----BEGIN CERTIFICATE-----"
  @pem_footer "-----END CERTIFICATE-----"

  @derive Jason.Encoder
  defstruct [
    type: :public,
    pem: nil,
    use: nil,
    role: nil
  ]

  use SmeeView.Aspects.AspectCommon

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
  def type(key) do
    key.type
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
  @spec encryption?(aspect :: __MODULE__.t()) :: boolean()
  def encryption?(%{use: "signing"}) do
    false
  end

  def encryption?(_cert) do
    true
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
  @spec signing?(aspect :: __MODULE__.t()) :: boolean()
  def signing?(%{use: "encryption"}) do
    false
  end

  def signing?(_cert) do
    true
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
  @spec pem(aspect :: __MODULE__.t()) :: binary()
  def pem(cert) do
    wrap_pem(cert.pem)
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
  @spec data(aspect :: __MODULE__.t()) :: binary()
  def data(cert) do
    unwrap_pem(cert.pem)
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
  @spec subject(aspect :: __MODULE__.t()) :: binary()
  def subject(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_subject()
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
  @spec issuer(aspect :: __MODULE__.t()) :: binary() | nil
  def issuer(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_issuer()
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
  @spec fingerprint(aspect :: __MODULE__.t()) :: binary()
  def fingerprint(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_fingerprint()
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
  @spec expires_at(aspect :: __MODULE__.t()) :: binary() | nil
  def expires_at(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_expires_at()
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
  @spec serial_number(aspect :: __MODULE__.t()) :: binary() | nil
  def serial_number(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_serial_number()
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
  @spec signature_algorithm(aspect :: __MODULE__.t()) :: binary() | nil
  def signature_algorithm(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_signature_algorithm()
  end

  #######################################################################################

  #@spec is not needed
 defp prepare_data(data, options \\ []) do
    Map.merge(
      data,
      %{
        pem: wrap_pem(data[:pem]),
        use: Utils.normalize(data[:use]),
        role: data[:role]
      }
    )
  end

  defp extract_subject(
         %{
           subject: %{
             aggregated: value
           }
         }
       ) do
    value
  end

  defp extract_subject(easy_ssl) do
    nil
  end

  defp extract_issuer(
         %{
           issuer: %{
             aggregated: value
           }
         }
       ) do
    value
  end

  defp extract_issuer(easy_ssl) do
    nil
  end

  defp extract_fingerprint(%{fingerprint: value}) do
    value
  end

  defp extract_fingerprint(easy_ssl) do
    nil
  end

  defp extract_expires_at(%{not_after: value}) do
    DateTime.from_unix!(value)
  end

  defp extract_expires_at(easy_ssl) do
    nil
  end

  defp extract_serial_number(%{serial_number: value}) do
    value
  end

  defp extract_serial_number(easy_ssl) do
    nil
  end

  defp extract_signature_algorithm(%{signature_algorithm: value}) do
    value
  end

  defp extract_signature_algorithm(easy_ssl) do
    nil
  end

  defp flatten_pem(pem_text) do
    pem_text
    |> String.trim()
    |> String.replace(~r/\s+/, "")
  end

  defp unflatten_pem(pem_text) do
    pem_text
    |> String.replace(~r/\s+/, "")
    |> String.codepoints()
    |> Enum.chunk_every(64)
    |> Enum.join("\n")
  end

  defp wrap_pem(@pem_header <> _ = pem_text) do
    pem_text
  end

  defp wrap_pem(pem_text) do
    [@pem_header, unflatten_pem(pem_text), @pem_footer]
    |> Enum.join("\n")
  end

  defp unwrap_pem(pem_text) do
    flatten_pem(pem_text)
    |> String.replace(@pem_header, "")
    |> String.replace(@pem_footer, "")
  end

end


defimpl String.Chars, for: SmeeView.Aspects.Key do
  def to_string(a), do: SmeeView.Aspects.Key.pem(a)
end
