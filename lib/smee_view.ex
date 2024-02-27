defmodule SmeeView do
  @moduledoc """
  SmeeView provides two types of module for extracting information from SAML metadata, loosely based on the concept
  of functional data access "lenses". SmeeView extends the [Smee](https://hexdocs.pm/smee/readme.html) library and requires
    metadata to be contained in individual `Smee.Entity` records.

  ## Views
  Views take metadata, or information extracted from metadata, and return a specific type of record from it, known as an
    aspect. They also allow further filtering and processing of lists of aspects.

  For instance `SmeeView.Logos` will extract all logo information from an entity's metadata and filter them so that only
    IdP logos of a particular shape are returned. The `SmeeView.EntityAttributes` module has lots of useful tools for
   gathering information about entities from their entity attributes (particularly if you can never remember any of the
  URIs like me)

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

  alias SmeeView.Entities

  @doc """
  Returns a list of `SmeeView.Aspect.Entity` structs extracted from the input data. Each one represents an entire SAML
    entity, and contains lists of other aspect structs representing each "aspect" of the entity.

  Input data can be a `Smee.Entity` or `Smee.Metadata` struct, or a list containing `Smee.Entity`, `Smee.Metadata` or
    any aspects. Only appropriate aspect records will be returned.

  `view/2` is useful for extracting specific types of aspects from one Entity, but because it has no entity ID information
    it's often not the best choice for handling Metadata. When extracting information from entire metadata files it's often
    better to use `prism/2` which returns the same data in a map, associated with each entity's ID.

  ```
  SmeeView.view(entity)
  # => [%Entity{}]

  SmeeView.view(metadata)
  # => [%Entity{}, %Entity{}, %Entity{}, ...]

  SmeeView.view([metadata, entity1, entity2])
  # => [%Entity{}, %Entity{}, %Entity{}, ...]

  ```

  """
  @spec view(smee_data :: Smee.Entity.t() | Smee.Metadata.t() | list(), options :: Keyword.t()) :: list()
  def view(smee_data, options \\ []) do
    Entities.view(smee_data, :all, options)
  end

  @doc """
  Returns a single `SmeeView.Aspect.Entity` aspect struct extracted from one record in the input data.

  Input data can be a `Smee.Entity` or `Smee.Metadata` struct, or a list containing `Smee.Entity`, `Smee.Metadata` or
    any aspects.

   **Only one aspect will be returned**. If you pass one Entity struct as the input, it will be that entity (obviously).
    If you pass metadata structs or lists the first suitable aspect found will be returned. It may not be from the first
    entity, if the first entity has no suitable content.

  `view_one/2` is *intended* for use with a single entity record and aspects like `SmeeView.Aspect.Entity`,
  `SmeeView.Aspect.SP' or `SmeeView.Aspect.Organization' but will work with any aspect.

  ```
  SmeeView.view_one(entity)
  # => %Entity{}

  SmeeView.view_one(metadata)
  # => %Entity{}

  ```

  """
  @spec view_one(smee_data :: Smee.Entity.t() | Smee.Metadata.t() | list(), options :: Keyword.t()) :: SmeeView.Aspects.Entity.t() | nil
  def view_one(smee_data, options \\ []) do
    smee_data
    |> Entities.view_one(:all, options)
  end

  @doc """
  Returns a map of `SmeeView.Aspect.Entity` aspect structs extracted from the input data, with entity IDs as keys.
   Each entity aspect represents an entire SAML entity, and contains lists of other aspect structs representing each
   "aspect" of the entity.

  Input data can be a `Smee.Entity` or `Smee.Metadata` struct, or a list containing `Smee.Entity` and/or `Smee.Metadata` structs.
  Only appropriate aspect records will be returned.

  `prism/2` is useful for extracting specific types of aspects from lists of entity records, or metadata. If you are
    only interested in one type of aspect from a single `Smee.Entity` struct then you should probably use `view/2` instead.

  ```
  SmeeView.prism(entity)
  # => %{"https://example.com/shibboleth" => [%Entity{}]}

  SmeeView.prism(metadata)
  # => %{"https://example.com/shibboleth" => [%Entity{}, %Entity{}, ...]}
  ```

  """
  @spec prism(smee_data :: Smee.Entity.t() | Smee.Metadata.t() | list(), options :: Keyword.t()) :: map()
  def prism(smee_data, options \\ []) do
    Entities.prism(smee_data, :all, options)
  end

end
