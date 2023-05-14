defmodule SmeeView do
  @moduledoc """
  Documentation for `SmeeView`.

  SmeeView provides two types of module for extracting information from SAML metadata, loosely based on the concept
  of data access "lenses". SmeeView extends the [Smee](https://hexdocs.pm/smee/readme.html) library and requires
    metadata to be contained in individual `Smee.Entity` records.

  ## Views
  Views take metadata, or information extracted from metadata, and return a specific type of record from it, known as an
    aspect. They also allow further filtering and processing of list()s of aspects.

  For instance `SmeeView.Logos` will extract all logo information from an entity's metadata and filter them so that only
    IdP logos of a particular shape are returned.

  ## Aspects

  Each fragment of information extracted from metadata by a View is an *aspect*. Aspects contain most (if not all) of
  the information present in the original metadata. Aspect modules provide ways to view or process that information.

  ## Convenience functions

  The top-level `SmeeView` module contains shortcuts to the view functions of every View module, and is the easiest way
    to get started. Each function below will return any available aspects from the entity metadata.

  ## References and further reading

  SmeeView does not document SAML Metadata itself - you'll need to read about that elsewhere if you have questions about
    how the information is used. The following resources will be of help:

  * [Incommon's Guide to SAML Metadata](https://spaces.at.internet2.edu/display/federation/metadata-saml) - very clear and readable
  * [OASIS Simplified Overview of SAML Metadata](https://www.oasis-open.org/committees/download.php/51890/SAML%20MD%20simplified%20overview.pdf)
  * [Wikipedia: SAML Metadata](https://en.wikipedia.org/wiki/SAML_metadata) Has technical overview, history and protocol walkthrough

  """

  alias Smee.Entity
  alias SmeeView.ArtifactResolutionServices
  alias SmeeView.AssertionConsumerServices
  alias SmeeView.AssertionIDRequestServices
  alias SmeeView.AttributeConsumingServices
  alias SmeeView.AttributeServices
  alias SmeeView.Attributes
  alias SmeeView.Contacts
  alias SmeeView.Descriptions
  alias SmeeView.DigestMethods
  alias SmeeView.DiscoHints
  alias SmeeView.DiscoUIs
  alias SmeeView.DiscoveryResponses
  alias SmeeView.Displaynames
  alias SmeeView.Domains
  alias SmeeView.EncryptionMethods
  alias SmeeView.Entities
  alias SmeeView.EntityAttributes
  alias SmeeView.Geolocations
  alias SmeeView.IdPs
  alias SmeeView.InformationURLs
  alias SmeeView.Keys
  alias SmeeView.Keywords
  alias SmeeView.Logos
  alias SmeeView.ManageNameidServices
  alias SmeeView.NameIDFormats
  alias SmeeView.NameidMappingServices
  alias SmeeView.Networks
  alias SmeeView.OrganizationURLs
  alias SmeeView.PrivacyURLs
  alias SmeeView.Protocols
  alias SmeeView.PublicationPath
  alias SmeeView.Registration
  alias SmeeView.RegistrationPolicies
  alias SmeeView.RequestInitiators
  alias SmeeView.RequestedAttributes
  alias SmeeView.SPs
  alias SmeeView.Scopes
  alias SmeeView.ServiceDescriptions
  alias SmeeView.ServiceNames
  alias SmeeView.SigningMethods
  alias SmeeView.SingleLogoutServices
  alias SmeeView.SingleSignonServices

  @doc """
  X
  """
  @spec logos(entity :: Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def logos(entity, options \\ []) do
    Logos.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec keys(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def keys(entity, options \\ []) do
    Keys.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec contacts(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def contacts(entity, options \\ []) do
    Contacts.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec displaynames(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def displaynames(entity, options \\ []) do
    Displaynames.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec descriptions(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def descriptions(entity, options \\ []) do
    Descriptions.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec domains(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def domains(entity, options \\ []) do
    Domains.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec networks(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def networks(entity, options \\ []) do
    Networks.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec geolocations(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def geolocations(entity, options \\ []) do
    Geolocations.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec keywords(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def keywords(entity, options \\ []) do
    Keywords.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec publication_path(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def publication_path(entity, options \\ []) do
    PublicationPath.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec registration(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def registration(entity, options \\ []) do
    Registration.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec registration_policies(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def registration_policies(entity, options \\ []) do
    RegistrationPolicies.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec scopes(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def scopes(entity, options \\ []) do
    Scopes.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec nameid_formats(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def nameid_formats(entity, options \\ []) do
    NameIDFormats.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec protocols(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def protocols(entity, options \\ []) do
    Protocols.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec idps(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def idps(entity, options \\ []) do
    IdPs.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec sps(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def sps(entity, options \\ []) do
    SPs.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec artifact_resolution_services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def artifact_resolution_services(entity, options \\ []) do
    ArtifactResolutionServices.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec assertion_consumer_services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def assertion_consumer_services(entity, options \\ []) do
    AssertionConsumerServices.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec assertion_id_request_services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def assertion_id_request_services(entity, options \\ []) do
    AssertionIDRequestServices.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec attribute_consuming_services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def attribute_consuming_services(entity, options \\ []) do
    AttributeConsumingServices.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec attribute_services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def attribute_services(entity, options \\ []) do
    AttributeServices.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec manage_nameid_services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def manage_nameid_services(entity, options \\ []) do
    ManageNameidServices.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec nameid_mapping_services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def nameid_mapping_services(entity, options \\ []) do
    NameidMappingServices.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec single_logout_services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def single_logout_services(entity, options \\ []) do
    SingleLogoutServices.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec single_signon_services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def single_signon_services(entity, options \\ []) do
    SingleSignonServices.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec services(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def services(entity, _role, options \\ []) do
    [
      SmeeView.ArtifactResolutionServices.view(entity, :all, options),
      SmeeView.AssertionConsumerServices.view(entity, :all, options),
      SmeeView.AssertionIDRequestServices.view(entity, :all, options),
      SmeeView.AttributeConsumingServices.view(entity, :all, options),
      SmeeView.AttributeServices.view(entity, :all, options),
      SmeeView.ManageNameidServices.view(entity, :all, options),
      SmeeView.NameidMappingServices.view(entity, :all, options),
      SmeeView.SingleLogoutServices.view(entity, :all, options),
      SmeeView.SingleSignonServices.view(entity, :all, options)
    ]
    |> List.flatten()
  end

  @doc """
  X
  """
  @spec requested_attributes(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def requested_attributes(entity, options \\ []) do
    RequestedAttributes.view(entity, :sp, options)
  end

  @doc """
  X
  """
  @spec service_descriptions(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def service_descriptions(entity, options \\ []) do
    ServiceDescriptions.view(entity, :sp, options)
  end

  @doc """
  X
  """
  @spec service_names(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def service_names(entity, options \\ []) do
    ServiceNames.view(entity, :sp, options)
  end

  @doc """
  X
  """
  @spec request_initiators(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def request_initiators(entity, options \\ []) do
    RequestInitiators.view(entity, :sp, options)
  end

  @doc """
  X
  """
  @spec discovery_responses(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def discovery_responses(entity, options \\ []) do
    DiscoveryResponses.view(entity, :sp, options)
  end

  @doc """
  X
  """
  @spec entity_attributes(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def entity_attributes(entity, options \\ []) do
    EntityAttributes.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec entities(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def entities(entity, options \\ []) do
    Entities.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec attributes(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def attributes(entity, options \\ []) do
    Attributes.view(entity, :idp, options)
  end

  @doc """
  X
  """
  @spec signing_methods(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def signing_methods(entity, options \\ []) do
    SigningMethods.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec digest_methods(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def digest_methods(entity, options \\ []) do
    DigestMethods.view(entity, :qll, options)
  end

  @doc """
  X
  """
  @spec encryption_methods(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def encryption_methods(entity, options \\ []) do
    EncryptionMethods.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec organization_urls(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def organization_urls(entity, options \\ []) do
    OrganizationURLs.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec information_urls(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def information_urls(entity, options \\ []) do
    InformationURLs.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec privacy_urls(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def privacy_urls(entity, options \\ []) do
    PrivacyURLs.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec disco_uis(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def disco_uis(entity, options \\ []) do
    DiscoUI.view(entity, :all, options)
  end

  @doc """
  X
  """
  @spec disco_hints(entity ::Smee.Entity.t() | list(), options :: Keyword.t()) :: list()
  def disco_hints(entity, options \\ []) do
    DiscoHints.view(entity, :all, options)
  end

  ###

end
