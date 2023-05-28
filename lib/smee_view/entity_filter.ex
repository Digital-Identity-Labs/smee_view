defmodule SmeeView.EntityFilter do

  @moduledoc """
  This module can extracts the `<ArtifactResolutionService>` elements in entity metadata as "aspect" structs, and then
  process and filter the results.

  Aspects can be extracted with three functions:

  * Views, via `view/2` are lists of aspects
  * Prisms, via `prism/2` are maps of entity IDs to views
  * There is also `view_one/2` which returns the first aspect of one entity

  Aspects can be extracted from `Smee.Metadata` structs, `Smee.Entity` structs, or lists of aspects, Metadata and Entity
    structs.

  The other functions in this module are intended to be applied to collections of aspect structs - for working with
    individual aspects, please look at the appropriate Aspect module.
  """

  alias SmeeView.Utils


  def idp(enum, bool \\ true) do

  end

  def sp(enum, bool \\ true) do

  end

  def entity_category(enum, cat, bool \\ true) do

  end

  def publisher do

  end

  def publication do

  end

  def logos do

  end

  def ui_text do

  end

  def scope do

  end

  def domain do

  end

  def network do

  end

  def ip_address do

  end

  def near do

  end

  def requests_attribute do

  end

  def provides_attribute do

  end

end
