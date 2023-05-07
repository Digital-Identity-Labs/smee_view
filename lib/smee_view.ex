defmodule SmeeView do
  @moduledoc """
  Documentation for `SmeeView`.
  """

  alias SmeeView.ArtifactResolutionServices
  alias SmeeView.AssertionConsumerServices
  alias SmeeView.AssertionIDRequestServices
  alias SmeeView.AttributeConsumingServices
  alias SmeeView.AttributeServices
  alias SmeeView.Attributes
  alias SmeeView.Contacts
  alias SmeeView.Descriptions
  alias SmeeView.DiscoveryResponses
  alias SmeeView.Displaynames
  alias SmeeView.Domains
  alias SmeeView.Entity
  alias SmeeView.EntityAttributes
  alias SmeeView.Geolocations
  alias SmeeView.IdP
  alias SmeeView.Keys
  alias SmeeView.Keywords
  alias SmeeView.Logos
  alias SmeeView.ManageNameidServices
  alias SmeeView.NameIDFormats
  alias SmeeView.NameidMappingServices
  alias SmeeView.Networks
  alias SmeeView.Protocols
  alias SmeeView.PublicationPath
  alias SmeeView.Registration
  alias SmeeView.RegistrationPolicies
  alias SmeeView.RequestInitiators
  alias SmeeView.RequestedAttributes
  alias SmeeView.SP
  alias SmeeView.Scopes
  alias SmeeView.ServiceDescriptions
  alias SmeeView.ServiceNames
  alias SmeeView.Services
  alias SmeeView.SingleLogoutServices
  alias SmeeView.SingleSignonServices
  alias SmeeView.DigestMethods
  alias SmeeView.SigningMethods
  alias SmeeView.EncryptionMethods
  alias SmeeView.OrganizationURLs
  alias SmeeView.PrivacyURLs
  alias SmeeView.InformationURLs
  alias SmeeView.DiscoUI
  alias SmeeView.DiscoHints

  def logos(entity, options \\ []) do
    Logos.view(entity, :all, options)
  end

  def keys(entity, options \\ []) do
    Keys.view(entity, :all, options)
  end

  def contacts(entity, options \\ []) do
    Contacts.view(entity, :all, options)
  end

  def displaynames(entity, options \\ []) do
    Displaynames.view(entity, :all, options)
  end

  def descriptions(entity, options \\ []) do
    Descriptions.view(entity, :all, options)
  end

  def domains(entity, options \\ []) do
    Domains.view(entity, :all, options)
  end

  def networks(entity, options \\ []) do
    Networks.view(entity, :all, options)
  end

  def geolocations(entity, options \\ []) do
    Geolocations.view(entity, :all, options)
  end

  def keywords(entity, options \\ []) do
    Keywords.view(entity, :all, options)
  end

  def publication_path(entity, options \\ []) do
    Publications.view(entity, :all, options)
  end

  def registration(entity, options \\ []) do
    Registration.view(entity, :all, options)
  end

  def registration_policies(entity, options \\ []) do
    RegistrationPolicies.view(entity, :all, options)
  end

  def scopes(entity, options \\ []) do
    Scopes.view(entity, :all, options)
  end

  def nameid_formats(entity, options \\ []) do
    NameIDFormats.view(entity, :all, options)
  end

  def protocols(entity, options \\ []) do
    Protocols.view(entity, :all, options)
  end

  def idp(entity, options \\ []) do
    IdP.view(entity, :all, options)
  end

  def sp(entity, options \\ []) do
    SP.view(entity, :all, options)
  end

  def artifact_resolution_services(entity, options \\ []) do
    ArtifactResolutionServices.view(entity, :all, options)
  end

  def assertion_consumer_services(entity, options \\ []) do
    AssertionConsumerServices.view(entity, :all, options)
  end

  def assertion_id_request_services(entity, options \\ []) do
    AssertionIDRequestServices.view(entity, :all, options)
  end

  def attribute_consuming_services(entity, options \\ []) do
    AttributeConsumingServices.view(entity, :all, options)
  end

  def attribute_services(entity, options \\ []) do
    AttributeServices.view(entity, :all, options)
  end

  def manage_nameid_services(entity, options \\ []) do
    ManageNameidServices.view(entity, :all, options)
  end

  def nameid_mapping_services(entity, options \\ []) do
    NameidMappingServices.view(entity, :all, options)
  end

  def single_logout_services(entity, options \\ []) do
    SingleLogoutServices.view(entity, :all, options)
  end

  def single_signon_services(entity, options \\ []) do
    SingleSignonServices.view(entity, :all, options)
  end

  def services(entity, options \\ []) do
    Services.view(entity, :all, options)
  end

  def requested_attributes(entity, options \\ []) do
    RequestedAttributes.view(entity, :sp, options)
  end

  def service_descriptions(entity, options \\ []) do
    ServiceDescriptions.view(entity, :sp, options)
  end

  def service_names(entity, options \\ []) do
    ServiceNames.view(entity, :sp, options)
  end

  def request_initiators(entity, options \\ []) do
    RequestInitiators.view(entity, :sp, options)
  end

  def discovery_responses(entity, options \\ []) do
    DiscoveryResponses.view(entity, :sp, options)
  end

  def entity_attributes(entity, options \\ []) do
    EntityAttributes.view(entity, :all, options)
  end

  def entity(entity, options \\ []) do
    Entity.view(entity, :all, options)
  end

  def attributes(entity, options \\ []) do
    Attributes.view(entity, :idp, options)
  end

  def signing_methods(entity, options \\ []) do
    SigningMethods.view(entity, :all, options)
  end

  def digest_methods(entity, options \\ []) do
    DigestMethods.view(entity, :qll, options)
  end

  def encryption_methods(entity, options \\ []) do
    EncryptionMethods.view(entity, :all, options)
  end

  def organization_urls(entity, options \\ []) do
    OrganizationURLs.view(entity, :all, options)
  end

  def information_urls(entity, options \\ []) do
    InformationURLs.view(entity, :all, options)
  end

  def privacy_urls(entity, options \\ []) do
    PrivacyURLs.view(entity, :all, options)
  end

  def disco_ui(entity, options \\ []) do
    DiscoUI.view(entity, :all, options)
  end

  def disco_hints(entity, options \\ []) do
    DiscoHints.view(entity, :all, options)
  end

  ###

end
