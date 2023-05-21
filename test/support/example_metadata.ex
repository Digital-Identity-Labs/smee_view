defmodule ExampleMetadata do

  @moduledoc false

  def oasis_idp1 do
    Smee.source("test/support/oasis_idp1.xml")
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def oasis_sp1 do
    Smee.source("test/support/oasis_idp1.xml")
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

end
