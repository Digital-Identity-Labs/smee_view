defmodule ExampleMetadata do

  @moduledoc false

  def aggregate do
    Smee.source("test/support/static/aggregate.xml")
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def live_ukamf do
    Smee.source("http://metadata.ukfederation.org.uk/ukfederation-metadata.xml")
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

end
