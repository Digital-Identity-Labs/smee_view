defmodule SmeeView.Aspects.Entity do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools



  defstruct [
    entity_id: nil,
    id: false,
    valid_until: nil,
    cache_duration: nil,
    registration: nil,
    publications: [],
    idp: nil,
    sp: nil,
    organization: nil,
    contacts: [],
    entity_attributes: []

  ]

  use SmeeView.Aspects.AspectCommon

  #######################################################################################





end
