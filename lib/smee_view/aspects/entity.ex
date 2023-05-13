defmodule SmeeView.Aspects.Entity do

  alias __MODULE__
  alias SmeeView.Utils

  @type t :: %__MODULE__{
               entity_id: binary(),
               id: binary(),
               valid_until: binary(),
               cache_duration: binary(),
               registration: binary(),
               publications: list(),
               idp: SmeeView.Aspects.Entity.t(),
               sp: SmeeView.Aspects.Entity.t(),
               organization: SmeeView.Aspects.Entity.t(),
               contacts: list(),
               entity_attributes: list()
             }

  defstruct [
    entity_id: nil,
    id: nil,
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

defimpl String.Chars, for: SmeeView.Aspects.Entity do
  def to_string(a), do: a.entity_id
end
