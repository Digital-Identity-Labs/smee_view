defmodule SmeeViewReadmeExamplesTest do

  use ExUnit.Case

  alias Smee.Entity
  alias Smee.Metadata
  alias SmeeView.Aspects
  alias SmeeView.Entities, as: ThisView


  ##
  ## This exists because Elixir's DocTests don't work well for complex examples that need setup - as
  ## the setup boilerplate can't be hidden so they become too noisy, and complex results are hard to match against
  ## without making the test even larger and noisier
  ##

  alias Smee.MDQ

  test "MDQ Lookup to Entity Aspect example" do

    result = MDQ.source("http://mdq.ukfederation.org.uk/")
             |> MDQ.lookup!("https://cern.ch/login")
             |> SmeeView.view_one()

    assert %SmeeView.Aspects.Entity{entity_id: "https://cern.ch/login"} = result

  end


  test "Get all the logos example" do

    results = Smee.source("http://metadata.ukfederation.org.uk/ukfederation-metadata.xml")
              |> Smee.fetch!()
              |> SmeeView.Logos.view()

    assert Enum.all?(results, fn a -> %SmeeView.Aspects.Logo{} = a end)

  end


  test "Pick a displayname example" do

    entity = Metadata.entity(ExampleMetadata.live_ukamf, "https://universitice-ng.univ-rouen.fr")

    result = entity
             |> SmeeView.Displaynames.view()
             |> SmeeView.Displaynames.pick("fr")
             |> SmeeView.Aspects.Displayname.text()

    assert "Plateforme pédagogique de pré-production de l'Université de Rouen Normandie" = result

  end

  test "Requested Attributes example" do

    the_entity = Metadata.entity(ExampleMetadata.live_ukamf, "https://unlv.photoshelter.com/sso/SAML2")

    results = the_entity
              |> SmeeView.RequestedAttributes.view()
              |> SmeeView.RequestedAttributes.required_filter()
              |> SmeeView.RequestedAttributes.friendly_names()

    assert ["eduPersonScopedAffiliation", "givenName", "mail", "sn"] = results

  end

  test "Contrived logo search example" do

    results = Smee.source("http://metadata.ukfederation.org.uk/ukfederation-metadata.xml")
              |> Smee.fetch!()
              |> SmeeView.Logos.view(:idp)
              |> Enum.filter(
                   fn logo ->
                     SmeeView.Aspects.Logo.size(logo) == :tiny &&
                       SmeeView.Aspects.Logo.shape(logo) == :square &&
                       SmeeView.Aspects.Logo.format(logo) == :png &&
                       SmeeView.Aspects.Logo.lang(logo) == "de"
                   end
                 )

    assert [] = results

  end

  test "Assurance prism example" do
    results = Smee.source("http://metadata.ukfederation.org.uk/ukfederation-metadata.xml")
              |> Smee.fetch!()
              |> SmeeView.EntityAttributes.prism()
              |> SmeeView.EntityAttributes.assurance_certifications()

    assert is_map(results)
    assert 3000 < Enum.count(results)
    assert Map.values(results)
           |> List.flatten
           |> Enum.all?(fn a -> is_binary(a) end)

  end

end
