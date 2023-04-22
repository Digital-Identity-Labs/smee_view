defmodule SmeeView do
  @moduledoc """
  Documentation for `SmeeView`.
  """

  alias SmeeView.Logos
  alias SmeeView.Keys
  alias SmeeView.Contacts
  alias SmeeView.Descriptions
  alias SmeeView.Domains
  alias SmeeView.Networks
  alias SmeeView.Geolocations
  alias SmeeView.Keywords
  alias SmeeView.PublicationPath
  alias SmeeView.Registration
  alias SmeeView.RegistrationPolicies
  alias SmeeView.Scopes
  alias SmeeView.NameIDFormats
  alias SmeeView.IdP
  alias SmeeView.ArtifactResolutionServices
  alias SmeeView.AssertionConsumerServices
  alias SmeeView.AssertionIDRequestServices
  alias SmeeView.AttributeConsumingServices
  alias SmeeView.AttributeServices
  alias SmeeView.ManageNameidServices
  alias SmeeView.NameidMappingServices
  alias SmeeView.SingleLogoutServices
  alias SmeeView.SingleSignonServices

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

  def idp(entity, options \\ []) do
    IdP.view(entity, :all, options)
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
    [
      ArtifactResolutionServices.view(entity, :all, options),
      AssertionConsumerServices.view(entity, :all, options),
      AssertionIDRequestServices.view(entity, :all, options),
      AttributeConsumingServices.view(entity, :all, options),
      AttributeServices.view(entity, :all, options),
      ManageNameidServices.view(entity, :all, options),
      NameidMappingServices.view(entity, :all, options),
      SingleLogoutServices.view(entity, :all, options),
      SingleSignonServices.view(entity, :all, options)
    ]
    |> List.flatten()
  end

end
