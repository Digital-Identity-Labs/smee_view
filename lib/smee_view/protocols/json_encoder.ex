defimpl Jason.Encoder, for: SmeeView.Aspects.ArtifactResolutionService do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "artifact_resolution_service"}),
      opts
    )
  end
end

defimpl Jason.Encoder, for: SmeeView.Aspects.AssertionConsumerService do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index, :default])
      |> Map.merge(%{st: "assertion_consumer_service"}),
      opts
    )
  end
end

defimpl Jason.Encoder, for: SmeeView.Aspects.AssertionIDRequestService do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "assertion_id_request_service"}),
      opts
    )
  end
end


defimpl Jason.Encoder, for: SmeeView.Aspects.AttributeConsumingService do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:service_names, :service_descriptions, :requested_attributes, :index, :default])
      |> Map.merge(%{st: "attribute_consuming_service"}),
      opts
    )
  end
end

defimpl Jason.Encoder, for: SmeeView.Aspects.AttributeService do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "AttributeService"}),
      opts
    )
  end
end

defimpl Jason.Encoder, for: SmeeView.Aspects.DiscoveryResponse do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "discovery_response"}),
      opts
    )
  end
end

defimpl Jason.Encoder, for: SmeeView.Aspects.ManageNameidService do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "manage_nameid_service"}),
      opts
    )
  end
end

defimpl Jason.Encoder, for: SmeeView.Aspects.NameidMappingService do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "nameid_mapping_service"}),
      opts
    )
  end
end

defimpl Jason.Encoder, for: SmeeView.Aspects.RequestInitiator do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "request_initiator"}),
      opts
    )
  end
end

defimpl Jason.Encoder, for: SmeeView.Aspects.SingleLogoutService do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "single_logout_service"}),
      opts
    )
  end
end

defimpl Jason.Encoder, for: SmeeView.Aspects.SingleSignonService do
  @moduledoc false
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [:binding, :location, :index])
      |> Map.merge(%{st: "single_signon_service"}),
      opts
    )
  end
end


