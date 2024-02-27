defimpl String.Chars, for: SmeeView.Aspects.ArtifactResolutionService do
  @moduledoc false
  def to_string(a), do: a.location
end

defimpl String.Chars, for: SmeeView.Aspects.Attribute do
  @moduledoc false
  def to_string(a), do: a.friendly_name
end

defimpl String.Chars, for: SmeeView.Aspects.AssertionConsumerService do
  @moduledoc false
  def to_string(a), do: a.location
end


defimpl String.Chars, for: SmeeView.Aspects.AssertionIDRequestService do
  @moduledoc false
  def to_string(a), do: a.location
end

defimpl String.Chars, for: SmeeView.Aspects.AttributeConsumingService do
  @moduledoc false
  def to_string(a), do: "Attribute Consuming Service #{a.index}"
end


defimpl String.Chars, for: SmeeView.Aspects.AttributeService do
  @moduledoc false
  def to_string(a), do: a.location
end

defimpl String.Chars, for: SmeeView.Aspects.Contact do
  @moduledoc false
  def to_string(a), do: SmeeView.Aspects.Contact.name_addr(a)
end


defimpl String.Chars, for: SmeeView.Aspects.Description do
  @moduledoc false
  def to_string(a), do: a.text
end

defimpl String.Chars, for: SmeeView.Aspects.DigestMethod do
  @moduledoc false
  def to_string(a), do: a.algorithm
end

defimpl String.Chars, for: SmeeView.Aspects.Organization do
  @moduledoc false
  def to_string(_a), do: "Disco Hints"
end

defimpl String.Chars, for: SmeeView.Aspects.DiscoUI do
  @moduledoc false
  def to_string(_a), do: "Disco UI"
end


defimpl String.Chars, for: SmeeView.Aspects.DiscoveryResponse do
  @moduledoc false
  def to_string(a), do: a.location
end


defimpl String.Chars, for: SmeeView.Aspects.Displayname do
  @moduledoc false
  def to_string(a), do: a.text
end

defimpl String.Chars, for: SmeeView.Aspects.Domain do
  @moduledoc false
  def to_string(a), do: a.domain
end

defimpl String.Chars, for: SmeeView.Aspects.EncryptionMethod do
  @moduledoc false
  def to_string(a), do: a.algorithm
end

defimpl String.Chars, for: SmeeView.Aspects.Entity do
  @moduledoc false
  def to_string(a), do: a.entity_id
end

defimpl String.Chars, for: SmeeView.Aspects.EntityAttribute do
  @moduledoc false
  def to_string(a), do: a.values
                        |> Enum.join("; ")
end

defimpl String.Chars, for: SmeeView.Aspects.Geolocation do
  @moduledoc false
  def to_string(a), do: a.geolocation
end

defimpl String.Chars, for: SmeeView.Aspects.IdP do
  @moduledoc false
  def to_string(_a), do: "IdP"
end

defimpl String.Chars, for: SmeeView.Aspects.InformationURL do
  @moduledoc false
  def to_string(a), do: a.url
end

defimpl String.Chars, for: SmeeView.Aspects.Key do
  @moduledoc false
  def to_string(a), do: SmeeView.Aspects.Key.pem(a)
end

defimpl String.Chars, for: SmeeView.Aspects.Keywords do
  @moduledoc false
  def to_string(a),
      do: a.words
          |> Enum.join(", ")
end

defimpl String.Chars, for: SmeeView.Aspects.Logo do
  @moduledoc false
  def to_string(a), do: a.url
end

defimpl String.Chars, for: SmeeView.Aspects.ManageNameidService do
  @moduledoc false
  def to_string(a), do: a.location
end

defimpl String.Chars, for: SmeeView.Aspects.NameIDFormat do
  @moduledoc false
  def to_string(a), do: a.uri
end

defimpl String.Chars, for: SmeeView.Aspects.NameidMappingService do
  @moduledoc false
  def to_string(a), do: a.location
end

defimpl String.Chars, for: SmeeView.Aspects.Network do
  @moduledoc false
  def to_string(a), do: a.network
end

defimpl String.Chars, for: SmeeView.Aspects.Null do
  @moduledoc false
  def to_string(_a), do: ""
end

defimpl String.Chars, for: SmeeView.Aspects.DiscoHints do
  @moduledoc false
  def to_string(_a), do: "Organization"
end

defimpl String.Chars, for: SmeeView.Aspects.OrganizationDisplayname do
  @moduledoc false
  def to_string(a), do: a.text
end

defimpl String.Chars, for: SmeeView.Aspects.OrganizationName do
  @moduledoc false
  def to_string(a), do: a.text
end

defimpl String.Chars, for: SmeeView.Aspects.OrganizationURL do
  @moduledoc false
  def to_string(a), do: a.url
end

defimpl String.Chars, for: SmeeView.Aspects.PrivacyURL do
  @moduledoc false
  def to_string(a), do: a.url
end

defimpl String.Chars, for: SmeeView.Aspects.Protocol do
  @moduledoc false
  def to_string(a), do: a.uri
end

defimpl String.Chars, for: SmeeView.Aspects.Publication do
  @moduledoc false
  def to_string(a), do: "#{a.publisher} #{a.publication_id}"
end

defimpl String.Chars, for: SmeeView.Aspects.Registration do
  @moduledoc false
  def to_string(a), do: a.authority
end

defimpl String.Chars, for: SmeeView.Aspects.RegistrationPolicy do
  @moduledoc false
  def to_string(a), do: a.url
end

defimpl String.Chars, for: SmeeView.Aspects.RequestInitiator do
  @moduledoc false
  def to_string(a), do: a.location
end

defimpl String.Chars, for: SmeeView.Aspects.RequestedAttribute do
  @moduledoc false
  def to_string(a), do: a.friendly_name
end

defimpl String.Chars, for: SmeeView.Aspects.Scope do
  @moduledoc false
  def to_string(a), do: a.domain
end

defimpl String.Chars, for: SmeeView.Aspects.ServiceDescription do
  @moduledoc false
  def to_string(a), do: a.text
end

defimpl String.Chars, for: SmeeView.Aspects.ServiceName do
  @moduledoc false
  def to_string(a), do: a.text
end

defimpl String.Chars, for: SmeeView.Aspects.SigningMethod do
  @moduledoc false
  def to_string(a), do: a.algorithm
end

defimpl String.Chars, for: SmeeView.Aspects.SingleLogoutService do
  @moduledoc false
  def to_string(a), do: a.location
end

defimpl String.Chars, for: SmeeView.Aspects.SingleSignonService do
  @moduledoc false
  def to_string(a), do: a.location
end

defimpl String.Chars, for: SmeeView.Aspects.SP do
  @moduledoc false
  def to_string(_a), do: "SP"
end

















