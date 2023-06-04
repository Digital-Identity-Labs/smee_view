defmodule AspectFixtures do

  @moduledoc false

  def fixtures(aspect_module, data_list) do
    data_list
    |> Enum.map(fn data_item -> apply(aspect_module, :new, [data_item]) end)
    |> Enum.sort()
  end

  def ukamf_requested_attributes() do
    fixtures(
      SmeeView.Aspects.RequestedAttribute,
      [
        %{
          friendly_name: "eduPersonScopedAffiliation",
          name: "urn:mace:dir:attribute-def:eduPersonScopedAffiliation",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonScopedAffiliation",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.9",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonTargetedID",
          name: "urn:mace:dir:attribute-def:eduPersonTargetedID",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonTargetedID",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.10",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonTargetedID",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.10",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonPrincipalName",
          name: "urn:mace:dir:attribute-def:eduPersonPrincipalName",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonPrincipalName",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.6",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonEntitlement",
          name: "urn:mace:dir:attribute-def:eduPersonEntitlement",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonEntitlement",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.7",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonAffiliation",
          name: "urn:mace:dir:attribute-def:eduPersonAffiliation",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonAffiliation",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.1",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonNickname",
          name: "urn:mace:dir:attribute-def:eduPersonNickname",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonNickname",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.2",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonOrgDN",
          name: "urn:mace:dir:attribute-def:eduPersonOrgDN",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonOrgDN",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.3",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonOrgUnitDN",
          name: "urn:mace:dir:attribute-def:eduPersonOrgUnitDN",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonOrgUnitDN",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.4",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonPrimaryAffiliation",
          name: "urn:mace:dir:attribute-def:eduPersonPrimaryAffiliation",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonPrimaryAffiliation",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.5",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonPrimaryOrgUnitDN",
          name: "urn:mace:dir:attribute-def:eduPersonPrimaryOrgUnitDN",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonPrimaryOrgUnitDN",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.8",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonAssurance",
          name: "urn:mace:dir:attribute-def:eduPersonAssurance",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonAssurance",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.11",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "eduPersonOrcid",
          name: "urn:oid:1.3.6.1.4.1.5923.1.1.1.16",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "cn",
          name: "urn:mace:dir:attribute-def:cn",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "cn",
          name: "urn:oid:2.5.4.3",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "description",
          name: "urn:mace:dir:attribute-def:description",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "description",
          name: "urn:oid:2.5.4.13",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "displayName",
          name: "urn:mace:dir:attribute-def:displayName",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "displayName",
          name: "urn:oid:2.16.840.1.113730.3.1.241",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "facsimileTelephoneNumber",
          name: "urn:mace:dir:attribute-def:facsimileTelephoneNumber",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "facsimileTelephoneNumber",
          name: "urn:oid:2.5.4.23",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "givenName",
          name: "urn:mace:dir:attribute-def:givenName",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "givenName",
          name: "urn:oid:2.5.4.42",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "initials",
          name: "urn:mace:dir:attribute-def:initials",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "initials",
          name: "urn:oid:2.5.4.43",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "l",
          name: "urn:mace:dir:attribute-def:l",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "l",
          name: "urn:oid:2.5.4.7",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "mail",
          name: "urn:mace:dir:attribute-def:mail",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "mail",
          name: "urn:oid:0.9.2342.19200300.100.1.3",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "manager",
          name: "urn:mace:dir:attribute-def:manager",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "manager",
          name: "urn:oid:0.9.2342.19200300.100.1.10",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "o",
          name: "urn:mace:dir:attribute-def:o",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "o",
          name: "urn:oid:2.5.4.10",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "ou",
          name: "urn:mace:dir:attribute-def:ou",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "ou",
          name: "urn:oid:2.5.4.11",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "postalCode",
          name: "urn:mace:dir:attribute-def:postalCode",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "postalCode",
          name: "urn:oid:2.5.4.17",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "postofficeBox",
          name: "urn:mace:dir:attribute-def:postOfficeBox",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "postOfficeBox",
          name: "urn:oid:2.5.4.18",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "preferredLanguage",
          name: "urn:mace:dir:attribute-def:preferredLanguage",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "preferredLanguage",
          name: "urn:oid:2.16.840.1.113730.3.1.39",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "seeAlso",
          name: "urn:mace:dir:attribute-def:seeAlso",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "seeAlso",
          name: "urn:oid:2.5.4.34",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "sn",
          name: "urn:mace:dir:attribute-def:sn",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "sn",
          name: "urn:oid:2.5.4.4",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "st",
          name: "urn:mace:dir:attribute-def:st",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "st",
          name: "urn:oid:2.5.4.8",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "street",
          name: "urn:mace:dir:attribute-def:street",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "street",
          name: "urn:oid:2.5.4.9",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "telephoneNumber",
          name: "urn:mace:dir:attribute-def:telephoneNumber",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "telephoneNumber",
          name: "urn:oid:2.5.4.20",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "title",
          name: "urn:mace:dir:attribute-def:title",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "title",
          name: "urn:oid:2.5.4.12",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "carLicense",
          name: "urn:mace:dir:attribute-def:carLicense",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "carLicense",
          name: "urn:oid:2.16.840.1.113730.3.1.1",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "departmentNumber",
          name: "urn:mace:dir:attribute-def:departmentNumber",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "departmentNumber",
          name: "urn:oid:2.16.840.1.113730.3.1.2",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "employeeNumber",
          name: "urn:mace:dir:attribute-def:employeeNumber",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "employeeNumber",
          name: "urn:oid:1.2.840.113556.1.2.610",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "employeeType",
          name: "urn:mace:dir:attribute-def:employeeType",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "employeeType",
          name: "urn:oid:1.2.840.113556.1.2.613",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "businessCategory",
          name: "urn:mace:dir:attribute-def:businessCategory",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "businessCategory",
          name: "urn:oid:2.5.4.15",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        },
        %{
          friendly_name: "physicalDeliveryOfficeName",
          name: "urn:mace:dir:attribute-def:physicalDeliveryOfficeName",
          name_format: "urn:mace:shibboleth:1.0:attributeNamespace:uri",
          required: false
        },
        %{
          friendly_name: "physicalDeliveryOfficeName",
          name: "urn:oid:2.5.4.19",
          name_format: "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          required: false
        }
      ] |> Enum.sort()
    )
  end



end
