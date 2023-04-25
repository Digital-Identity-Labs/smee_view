defmodule SmeeView.Aspects.Entity do

  alias __MODULE__
  alias SmeeView.Utils
  alias SmeeView.Aspects.AspectTools


  use SmeeView.Aspects.AspectCommon

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
    contacts: []

  ]

  def new(data, options \\ []) do

    data = Map.merge(
      data,
      %{
      }
    )
    struct(%Entity{}, data)
  end

  #######################################################################################



end
