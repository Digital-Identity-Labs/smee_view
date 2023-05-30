defmodule ExampleEntities do

  @moduledoc false

  def adfs do
    Smee.source("test/support/static/adfs.xml", type: :single)
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def indiid do
    Smee.source("test/support/static/indiid.xml", type: :single)
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def oasis_idp1 do
    Smee.source("test/support/static/oasis_idp1.xml", type: :single)
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def oasis_sp1 do
    Smee.source("test/support/static/oasis_sp1.xml", type: :single)
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def shib_cas_sp1 do
    Smee.source("test/support/static/shib_cas_sp1.xml", type: :single)
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def shib_oidc_sp1 do
    Smee.source("test/support/static/shib_oidc_sp1.xml", type: :single)
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def shib_oidc_sp2 do
    Smee.source("test/support/static/shib_oidc_sp2.xml", type: :single)
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def shib_oidc_sp3 do
    Smee.source("test/support/static/shib_oidc_sp3.xml", type: :single)
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

  def uom do
    Smee.source("test/support/static/uom.xml", type: :single)
    |> Smee.fetch!()
    |> Smee.Metadata.entities()
    |> List.first()
  end

end
