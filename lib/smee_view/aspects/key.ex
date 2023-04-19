defmodule SmeeView.Aspects.Key do

  alias __MODULE__
  alias Smee.Entity

  @pem_header "-----BEGIN CERTIFICATE-----"
  @pem_footer "-----END CERTIFICATE-----"

  @enforce_keys [:pem]
  defstruct [
    type: :public,
    pem: nil,
    use: nil,
    role: nil
  ]

  def new(data, options \\ []) do
    struct(%Key{pem: wrap_pem(data[:pem]), use: normalize_use(data[:use]), role: data[:role]})
  end

  def type(key) do
    key.type
  end

  def encryption?(%{use: "signing"}) do
    false
  end

  def encryption?(_cert) do
    true
  end

  def signing?(%{use: "encryption"}) do
    false
  end

  def signing?(_cert) do
    true
  end

  def pem(cert) do
    wrap_pem(cert.pem)
  end

  def data(cert) do
    unwrap_pem(cert.pem)
  end

  def subject(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_subject()
  end

  def issuer(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_issuer()
  end

  def fingerprint(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_fingerprint()
  end

  def expires_at(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_expires_at()
  end

  def serial_number(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_serial_number()
  end

  def signature_algorithm(cert) do
    cert.pem
    |> EasySSL.parse_pem()
    |> extract_signature_algorithm()
  end

  #######################################################################################

  defp normalize_use(value) when is_nil(value) or value == "" do
    nil
  end

  defp normalize_use(value) do
    "#{value}"
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
    #    |> Enum.chunk_every(64)
    #    |> Enum.join("\n")
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
#
#defmodule MdmaPipeline.Digestor.Processor.Rebuild.RebuildCertificate do
#  @moduledoc false
#
#  use MdmaPipeline.Digestor.MetadataXMLUtils
#
#  use Timex
#
#  require Logger
#  require OK
#
#  alias __MODULE__
#  alias MdmaPipeline.Digestor.Bundle
#  alias Mdma.Metadata.Certificate
#  alias Mdma.Metadata.SamlAa
#  alias Mdma.Metadata.SamlIdp
#  alias Mdma.Metadata.SamlSp
#  alias Mdma.Metadata.Glitch
#  alias Mdma.Repo
#
#  import Apex.AwesomeDef
#  import MdmaPipeline.Digestor.Processor.ProcessorToolkit, only: [report_entity_glitch: 2]
#
#  def process(bundle) do
#
#    Logger.debug "Rebuilding certificate"
#
#    xml_details = extract_xml_details(bundle)
#
#    for service_type <- [:idp_certs, :sp_certs, :aa_certs] do
#      if service_exists?(service_type, bundle) do
#        Enum.map(xml_details[service_type], fn(details) ->
#          build_cert_changes(service_type, details, bundle) end)
#        |> update_records(service_type, bundle)
#      end
#    end
#
#    {:ok, bundle}
#
#  end
#
#  def extract_xml_details(bundle) do
#    bundle.parsed_xml
#    |> xmap(
#         idp_certs: [
#           ~x"//md:IDPSSODescriptor/md:KeyDescriptor"el,
#           pem: ~x"string(//ds:X509Certificate)"s
#                |> transform_by(&RebuildCertificate.tidy_pem/1),
#           names: ~x"string(//ds:KeyName)"ls,
#           use: ~x"string(/*/@use)"s,
#           subject: ~x"//ds:KeyInfo/ds:X509Data/ds:X509SubjectName"S,
#           algorithms: ~x"//md:EncryptionMethod/@algorithm"Sl
#         ],
#         aa_certs: [
#           ~x"//md:AttributeAuthorityDescriptor/md:KeyDescriptor"el,
#           pem: ~x"string(//ds:X509Certificate)"s
#                |> transform_by(&RebuildCertificate.tidy_pem/1),
#           names: ~x"string(//ds:KeyName)"ls,
#           use: ~x"string(/*/@use)"s,
#           subject: ~x"//ds:KeyInfo/ds:X509Data/ds:X509SubjectName"S,
#           algorithms: ~x"//md:EncryptionMethod/@algorithm"Sl
#         ],
#         sp_certs: [
#           ~x"//md:SPSSODescriptor/md:KeyDescriptor"el,
#           pem: ~x"string(//ds:X509Certificate)"s
#                |> transform_by(&RebuildCertificate.tidy_pem/1),
#           names: ~x"string(//ds:KeyName)"ls,
#           use: ~x"string(/*/@use)"s,
#           subject: ~x"//ds:KeyInfo/ds:X509Data/ds:X509SubjectName"S,
#           algorithms: ~x"//md:EncryptionMethod/@algorithm"Sl
#         ]
#       )
#  end
#
#  def tidy_pem(pem_text) do
#    pem_text
#    |> String.trim()
#    |> String.replace(~r/\s+/, "")
#  end
#
#  def wrap_raw_pem_data(data) do
#    Enum.join(
#      [
#        "-----BEGIN CERTIFICATE-----",
#        data,
#        "-----END CERTIFICATE-----"],
#      "\n")
#  end
#
#  def build_cert_changes(service_type, md_details, bundle) do
#
#    cert_info = wrap_raw_pem_data(md_details[:pem]) |> parse_pem(bundle)
#
#    changes = %{
#      fingerprint: cert_info[:fingerprint],
#      names: md_details[:names],
#      subject: cert_info[:subject][:aggregated],
#      sign: for_signing?(md_details),
#      encrypt: for_encryption?(md_details),
#      transport: for_transport?(md_details),
#      pem: md_details[:pem],
#      info: cert_info,
#      algorithms: md_details[:algorithms]
#    }
#
#  end
#
#  def update_records(records, service_type, bundle) do
#    case Enum.count(records) do
#      0 ->
#        report_entity_glitch("No certificates", bundle)
#      #from(c in Certificates, where: c.id < 10) |> Repo.delete_all
#      _ ->
#        Enum.each(records, fn(record) -> save_cert(record, service_type, bundle) end)
#
#    end
#
#  end
#
#  def save_cert(changes, service_type, bundle) do
#
#    service = get_service(service_type, bundle)
#    {service_module, service_id} = service_constructor_parts(service_type, bundle)
#
#    entity = case find_existing_cert(changes, service_type, bundle) do
#               nil    -> struct(Certificate, changes)
#               entity -> entity
#             end
#             |> Certificate.changeset(changes)
#             |> set_service_assoc(service_type, bundle)
#             |> Repo.insert_or_update
#
#  end
#
#  def service_exists?(service_type, bundle) do
#    {_, id} = service_constructor_parts(service_type, bundle)
#    case id do
#      nil -> false
#      _   -> true
#    end
#  end
#
#  def service_constructor_parts(service_type, bundle) do
#    case service_type do
#      :idp_certs -> {SamlIdp, bundle.idp_id}
#      :aa_certs  -> {SamlAa,  bundle.aa_id}
#      :sp_certs  -> {SamlSp,  bundle.sp_id}
#    end
#  end
#
#  def find_existing_cert(record, service_type, bundle) do
#    case service_type do
#      :idp_certs -> Repo.get_by(Certificate, fingerprint: record[:fingerprint], saml_idp_id: bundle.idp_id)
#      :aa_certs  -> Repo.get_by(Certificate, fingerprint: record[:fingerprint], saml_aa_id:  bundle.aa_id)
#      :sp_certs  -> Repo.get_by(Certificate, fingerprint: record[:fingerprint], saml_sp_id:  bundle.sp_id)
#    end
#  end
#
#  def set_service_assoc(changes, service_type, bundle) do
#    case service_type do
#      :idp_certs -> Ecto.Changeset.change(changes, saml_idp_id: bundle.idp_id)
#      :aa_certs  -> Ecto.Changeset.change(changes, saml_aa_id: bundle.aa_id)
#      :sp_certs  -> Ecto.Changeset.change(changes, saml_sp_id: bundle.sp_id)
#    end
#  end
#
#  def assoc_field_for_service(service_type) do
#    case service_type do
#      :idp_certs -> :saml_idp_id
#      :aa_certs  -> :saml_aa_id
#      :sp_certs  -> :saml_sp_id
#    end
#  end
#
#  def get_service(service_type, bundle) do
#    {module, id} = service_constructor_parts(service_type, bundle)
#    Repo.get!(module, id)
#  end
#
#  def parse_pem(pem, bundle) do
#    try do
#      EasySSL.parse_pem(pem)
#    rescue
#      _ ->
#        report_entity_glitch("Cannot parse certificate!", bundle)
#        %{error: true, subject: %{aggregated: nil}, fingerprint: "00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:de:ad"}
#    end
#  end
#
#  def for_signing?(md_details) do
#    case md_details[:use] do
#      "signing" -> true
#      ""        -> true
#      _         -> false
#    end
#  end
#
#  def for_encryption?(md_details) do
#    case md_details[:use] do
#      "encryption" -> true
#      ""           -> true
#      _            -> false
#    end
#  end
#
#  def for_transport?(md_details) do
#    case md_details[:use] do
#      "transport" -> true
#      ""          -> false
#      _           -> false
#    end
#  end
#
#end
