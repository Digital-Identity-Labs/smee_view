defmodule SmeeView.Aspects.Key do

  @moduledoc """
  Represents and processes <KeyDescriptor> elements in entity metadata as Aspect structs.

  This is information about the keys used by an IdP or SP for signing and encryption and contains the *public key*

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """


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
  Return the key type: signing, encryption or nil. Nil indicates that the key is general-purpose.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.type(aspect)
  # => "signing"
  ```
  """
  @spec type(aspect :: __MODULE__.t()) :: binary()
  def type(key) do
    key.type
  end

  @doc """
  Is the key suitable for encryption use?

  Not that this is *used for*, not specifically for - a type of nil indicates both signing and encryption use.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.encryption?(aspect)
  # => true
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
  Is the key suitable for signing use?

  Not that this is *used for*, not specifically for - a type of nil indicates both signing and encryption use.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.signing?(aspect)
  # => false
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
  Returns the public key as a PEM string (a BASE64-encoded DER certificate).

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.pem(aspect)
  # => "-----BEGIN CERTIFICATE-----\n#MIICMzCCAZygAwIBAgIJALiPnVsvq..."
  ```
  """
  @spec pem(aspect :: __MODULE__.t()) :: binary()
  def pem(cert) do
    wrap_pem(cert.pem)
  end

  @doc """
  Returns the raw BASE64 string data of the key, without PEM headers, as stored in the metadata

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.data(aspect)
  # => "MIICMzCCAZygAwIBAgIJALiPnVsvq..."
  ```
  """
  @spec data(aspect :: __MODULE__.t()) :: binary()
  def data(cert) do
    unwrap_pem(cert.pem)
  end

  @doc """
  Returns the subject CN of the key/certificate

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.subject(aspect)
  # => "/CN=hex.unseen.edu/OU=Domain Control Validated"
  ```
  """
  @spec subject(aspect :: __MODULE__.t()) :: binary()
  def subject(cert) do
    cert.pem
    |> Smee.EasySSL.parse_pem()
    |> extract_subject()
  end

  @doc """
  Returns the issuer CN of the certificate

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.issuer(aspect)
  # => "CN=Ankh Morpork Post Office"
  ```
  """
  @spec issuer(aspect :: __MODULE__.t()) :: binary() | nil
  def issuer(cert) do
    cert.pem
    |> Smee.EasySSL.parse_pem()
    |> extract_issuer()
  end

  @doc """
  Returns the SHA1 fingerprint of the certificate

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.fingerprint(aspect)
  # => "A5:9C:E0:47:C1:34:88:9F:16:0B:15:0C:9E:A1:B9:05:6D:8C:37:FE"
  ```
  """
  @spec fingerprint(aspect :: __MODULE__.t()) :: binary()
  def fingerprint(cert) do
    cert.pem
    |> Smee.EasySSL.parse_pem()
    |> extract_fingerprint()
  end

  @doc """
  Returns the expiry date (Not After) for the certificate

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.expires_at(aspect)
  # => ~U[2023-05-21 16:12:05.481701Z]
  ```
  """
  @spec expires_at(aspect :: __MODULE__.t()) :: binary() | nil
  def expires_at(cert) do
    cert.pem
    |> Smee.EasySSL.parse_pem()
    |> extract_expires_at()
  end

  @doc """
  Returns the serial number for the certificate

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.serial_number(aspect)
  # => "27ACAE30B9F323"
  ```
  """
  @spec serial_number(aspect :: __MODULE__.t()) :: binary() | nil
  def serial_number(cert) do
    cert.pem
    |> Smee.EasySSL.parse_pem()
    |> extract_serial_number()
  end

  @doc """
  Return the signature algorithm as a string (not a list!)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.signature_algorithm(aspect)
  # => "sha, rsa"
  ```
  """
  @spec signature_algorithm(aspect :: __MODULE__.t()) :: binary() | nil
  def signature_algorithm(cert) do
    cert.pem
    |> Smee.EasySSL.parse_pem()
    |> extract_signature_algorithm()
  end

  #######################################################################################

  #@spec is not needed
 defp prepare_data(data) do
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

  defp extract_subject(_easy_ssl) do
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

  defp extract_issuer(_easy_ssl) do
    nil
  end

  defp extract_fingerprint(%{fingerprint: value}) do
    value
  end

  defp extract_fingerprint(_easy_ssl) do
    nil
  end

  defp extract_expires_at(%{not_after: value}) do
    DateTime.from_unix!(value)
  end

  defp extract_expires_at(_easy_ssl) do
    nil
  end

  defp extract_serial_number(%{serial_number: value}) do
    value
  end

  defp extract_serial_number(_easy_ssl) do
    nil
  end

  defp extract_signature_algorithm(%{signature_algorithm: value}) do
    value
  end

  defp extract_signature_algorithm(_easy_ssl) do
    nil
  end

  defp flatten_pem(pem_text) do
    pem_text
    |> String.trim()
    |> String.replace(~r/\s+/, "")
  end

  defp unflatten_pem(nil) do
    ""
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

