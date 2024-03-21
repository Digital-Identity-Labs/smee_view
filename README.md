# SmeeView

`SmeeView` is a metadata parsing extension to [Smee](https://github.com/Digital-Identity-Labs/smee). SmeeView provides
easy to use functions for extracting lists of information from SAML metadata as Elixir structs.

[Smee](https://github.com/Digital-Identity-Labs/smee) provides access to entity metadata XML as both strings and parsed
`xmerl` records but leaves the user to find and extract the information they need. SmeeView aims to fill this gap by
providing tools for working with the most commonly used information in SAML metadata.

SmeeView is *loosely* based on the concept of functional data access "lenses".

[![Hex pm](http://img.shields.io/hexpm/v/smee_view.svg?style=flat)](https://hex.pm/packages/smee_view)
[![API Docs](https://img.shields.io/badge/api-docs-yellow.svg?style=flat)](http://hexdocs.pm/smee_view/)
![Github Elixir CI](https://github.com/Digital-Identity-Labs/smee_view/workflows/Elixir%20CI/badge.svg)

[![Run in Livebook](https://livebook.dev/badge/v1/blue.svg)](https://livebook.dev/run?url=https%3A%2F%2Fraw.githubusercontent.com%2FDigital-Identity-Labs%2Fsmee_view%2Fmain%2Fsmee_view_notebook.livemd)
## Features

* Relatively low memory usage and decent speed, especially when extracting smaller fragments of information
* Aspects can be extracted from individual `Smee.Entity` or `Smee.Metadata` structs, lists of them, or even other
  aspects.
* Aspects are extracted as either lists or as lists in maps, associated with entity IDs.
* Filters and tools are provided for handling aspects such as logos or multilingual text, and for checking commonly used
  entity attributes.

## Overview

### Views

View modules take metadata, or information extracted from metadata, and return a specific type of record from it, known
as an aspect. They also allow further filtering and processing of lists of aspects.

For instance `SmeeView.Logos` can extract all logo information from an entity's metadata and filter them so that only
IdP logos of a particular shape are returned. `SmeeView.Contacts` provides tools for extracting and filtering
`SmeeView.Aspects.Contact` records.

### Aspects

Each fragment of information extracted from metadata by a View is an *aspect*. Aspects contain most (if not all) of
the information present in the original metadata. Aspect modules provide ways to view or process that information.

Some aspects contain bundles of other aspects:

* A `SmeeView.Aspects.DiscoUI` struct contains lists of types of aspects useful for metadata discovery
* `SmeeView.Aspects.IdP` structs contain all aspects related to an entity's IdP role

### Convenience functions

The top level `SmeeView` module contains simplified, top level functions for extracting all the information for an
entity.
Other modules in SmeeView contain functions dedicated to specific types of information - one for extracting collections
of
"aspects", the other for working with individual records.

## Examples

### Extracting all data for an entity (using Smee's MDQ module)

```elixir
alias Smee.MDQ

MDQ.source("http://mdq.ukfederation.org.uk/")
|> MDQ.lookup!("https://cern.ch/login")
|> SmeeView.view_one()
# => %SmeeView.Aspects.Entity{
#       entity_id: "https://cern.ch/login",
#       cache_duration: "P0Y0M0DT6H0M0.000S",
#       registration: [
#         %SmeeView.Aspects.Registration{
#           authority: "http://rr.aai.switch.ch/",
#           instant: "2014-07-29T13:17:52Z",
#           policies: [
#             %SmeeView.Aspects.RegistrationPolicy{
#               lang: "en",
#               url: "https://www.switch.ch/aai/federation/switchaai/metadata-registration-practice-statement-20110711.txt"
#            }
#          ]
#         }
#        ],
#        publications: [],
#        idps: [
#          %SmeeView.Aspects.IdP{
#            protocols: [
#              %SmeeView.Aspects.Protocol{
#                role: :idp,
#                uri: "urn:oasis:names:tc:SAML:2.0:protocol"
#             }
# ...
```

### Viewing all logos in an entire federation

```elixir
Smee.source("http://metadata.ukfederation.org.uk/ukfederation-metadata.xml")
|> Smee.fetch!()
|> SmeeView.Logos.view()
## => [
#%SmeeView.Aspects.Logo{
#  url: "https://idp2.iay.org.uk/images/heads_80x80.jpg",
#  role: :idp,
#  height: 80,
#  width: 80,
#  lang: "en"
#},
#%SmeeView.Aspects.Logo{
#url: "https://idp2.iay.org.uk/images/heads_100x43.jpg",
#     role: :idp,
#height: 43,
#width: 100,
#lang: "en"
#},
#...
```
 

### Selecting the best service displayname for a French user

```elixir
entity
|> SmeeView.Displaynames.view()
|> SmeeView.Displaynames.pick("fr")
|> SmeeView.Aspects.Displayname.text()
# => "Plateforme pédagogique de pré-production de l'Université de Rouen Normandie"
```

### Get the friendly names of all attributes required by a particular entity

```elixir
the_entity
|> SmeeView.RequestedAttributes.view()
|> SmeeView.RequestedAttributes.required_filter()
|> SmeeView.RequestedAttributes.friendly_names()
# => ["email", "eppn"]
```

### Find all the tiny square logos for IdPs in PNG format in German 

(It's a very contrived example)

```elixir
Smee.source("http://metadata.ukfederation.org.uk/ukfederation-metadata.xml")
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
# => []
```

### List the assurance certifications of each entity in a federation

This demonstrates the usefulness of prism views 

```elixir
Smee.source("http://metadata.ukfederation.org.uk/ukfederation-metadata.xml")
|> Smee.fetch!()
|> SmeeView.EntityAttributes.prism()
|> SmeeView.EntityAttributes.assurance_certifications()
# => %{
#        "https://stanford.dserec.com/sp" => ["https://refeds.org/sirtfi"],
#        "https://iam.nnfc.re.kr/idp/simplesamlphp" => ["https://refeds.org/sirtfi"],
#        "http://idp.vr.se/adfs/services/trust" => ["http://www.swamid.se/policy/assurance/al1"],
#        ...
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `smee_view` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:smee_view, "~> 0.2"}
  ]
end
```

SmeeView requires [Smee](https://github.com/Digital-Identity-Labs/smee), which has its own unusual requirements, so
please make sure you read the documentation for installing Smee before using SmeeView.

## References and further reading

SmeeView does not document SAML Metadata itself - you'll need to read about that elsewhere if you have questions about
how the information is used. The following resources will be of help:

* [Incommon's Guide to SAML Metadata](https://spaces.at.internet2.edu/display/federation/metadata-saml) - very clear and
  readable
* [OASIS Simplified Overview of SAML Metadata](https://www.oasis-open.org/committees/download.php/51890/SAML%20MD%20simplified%20overview.pdf)
* [Wikipedia: SAML Metadata](https://en.wikipedia.org/wiki/SAML_metadata) Has technical overview, history and protocol
  walkthrough

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/smee_view>.

## Contributing

You can request new features by creating an [issue](https://github.com/Digital-Identity-Labs/smee_view/issues),
or submit a [pull request](https://github.com/Digital-Identity-Labs/smee_view/pulls) with your contribution.

If you are comfortable working with Python but Smee's Elixir code is unfamiliar then this blog post may help:
[Elixir For Humans Who Know Python](https://hibox.live/elixir-for-humans-who-know-python)

## Copyright and License

Copyright (c) 2023, 2024 Digital Identity Ltd, UK

SmeeView is Apache 2.0 licensed.

## Disclaimer

SmeeView is not endorsed by The Shibboleth Foundation or any other organisation described in these docs.
The API will definitely change considerably in the first few releases after 0.1.0 - it is not stable!
