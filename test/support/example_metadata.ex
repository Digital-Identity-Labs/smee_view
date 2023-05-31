defmodule ExampleMetadata do

  @moduledoc false

  def aggregate do
    Smee.source("test/support/static/aggregate.xml")
    |> Smee.fetch!()
  end

  def live_ukamf do
    Smee.source("http://metadata.ukfederation.org.uk/ukfederation-metadata.xml")
    |> Smee.fetch!()
  end

end
