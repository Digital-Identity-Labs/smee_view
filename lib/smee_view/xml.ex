defmodule SmeeView.XML do
  @moduledoc false

  # Define implementation for user modules to use
  import SweetXml, except: [sigil_x: 2, parse: 1]

  def sigil_x(str, opts) do
    SweetXml.sigil_x(str, opts)
    |> add_namespace("", "urn:oasis:names:tc:SAML:2.0:metadata")
    |> add_namespace("ds", "http://www.w3.org/2000/09/xmldsig#")
    |> add_namespace("md", "urn:oasis:names:tc:SAML:2.0:metadata")
    |> add_namespace("mdattr", "urn:oasis:names:tc:SAML:metadata:attribute")
    |> add_namespace("mdrpi", "urn:oasis:names:tc:SAML:metadata:rpi")
    |> add_namespace("mdui", "urn:oasis:names:tc:SAML:metadata:ui")
    |> add_namespace("pyff", "http://pyff.io/NS")
    |> add_namespace("ukfedlabel", "http://ukfederation.org.uk/2006/11/label")
    |> add_namespace("saml", "urn:oasis:names:tc:SAML:2.0:assertion")
    |> add_namespace("shibmd", "urn:mace:shibboleth:metadata:1.0")
    |> add_namespace("xrd", "http://docs.oasis-open.org/ns/xri/xrd-1.0")
    |> add_namespace("xs", "http://www.w3.org/2001/XMLSchema")
    |> add_namespace("xsi", "http://www.w3.org/2001/XMLSchema-instance")
    |> add_namespace("idpdisc", "urn:oasis:names:tc:SAML:profiles:SSO:idp-discovery-protocol")
    |> add_namespace("init", "urn:oasis:names:tc:SAML:profiles:SSO:request-init")
    |> add_namespace("remd", "http://refeds.org/metadata")
    |> add_namespace("alg", "urn:oasis:names:tc:SAML:metadata:algsupport")
    |> add_namespace("req-attr", "urn:oasis:names:tc:SAML:protocol:ext:req-attr")
    |> add_namespace("taat", "http://www.eenet.ee/EENet/urn")
    |> add_namespace("xenc", "http://www.w3.org/2001/04/xmlenc#")
    |> add_namespace("hoksso", "urn:oasis:names:tc:SAML:2.0:profiles:holder-of-key:SSO:browser")
    |> add_namespace("eduidmd", "http://eduid.cz/schema/metadata/1.0")
  end

  def parse(xml) do
    SweetXml.parse(xml, namespace_conformant: true)
  end

  # Defoverridable makes the given functions in the current module overridable
  defoverridable [sigil_x: 2, parse: 1]
end
