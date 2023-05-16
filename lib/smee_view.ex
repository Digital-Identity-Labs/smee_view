defmodule SmeeView do
  @moduledoc """
  Documentation for `SmeeView`.

  SmeeView provides two types of module for extracting information from SAML metadata, loosely based on the concept
  of data access "lenses". SmeeView extends the [Smee](https://hexdocs.pm/smee/readme.html) library and requires
    metadata to be contained in individual `Smee.Entity` records.

  ## Views
  Views take metadata, or information extracted from metadata, and return a specific type of record from it, known as an
    aspect. They also allow further filtering and processing of list()s of aspects.

  For instance `SmeeView.Logos` will extract all logo information from an entity's metadata and filter them so that only
    IdP logos of a particular shape are returned.

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

  alias Smee.Entity
  alias Smee.Metadata
  alias SmeeView.Entities

  @doc """
  X
  """
  @spec view(smee_data :: Smee.Entity.t() | Smee.Metadata.t() | list(), options :: Keyword.t()) :: list()
  def view(smee_data, options \\ []) do
    Entities.view(smee_data, :all, options)
  end

  @doc """
  X
  """
  @spec view_one(smee_data :: Smee.Entity.t(), options :: Keyword.t()) :: list()
  def view_one(smee_data, options \\ []) do
    smee_data
    |> Entities.view_one(:all, options)
  end

  @doc """
  X
  """
  @spec prism(smee_data :: Smee.Entity.t() | Smee.Metadata.t() | list(), options :: Keyword.t()) :: list()
  def prism(smee_data, options \\ []) do
    Entities.prism(smee_data, :all, options)
  end

end
