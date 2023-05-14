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
               idps: list(),
               sps: list(),
               organizations: list(),
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
    idps: [],
    sps: [],
    organizations: nil,
    contacts: [],
    entity_attributes: []
  ]

  use SmeeView.Aspects.AspectCommon

  def idp(%{idps: idps}) when is_list(idps) do
    List.first(idps)
  end

  def idp(_) do
    nil
  end

  def idp?(aspect) do
    idp(aspect) != nil
  end

  def sp(%{sps: sps}) when is_list(sps) do
    List.first(sps)
  end

  def sp(_) do
    nil
  end

  def sp?(aspect) do
    sp(aspect) != nil
  end

  def organization(%{organizations: organizations}) when is_list(organizations) do
    List.first(organizations)
  end

  def organization(_) do
    nil
  end

  def organization?(aspect) do
    organization(aspect) != nil
  end

  def roles(aspect) do
    [idp(aspect), sp(aspect)] |> Enum.filter(& &1)
  end

  #######################################################################################

end

defimpl String.Chars, for: SmeeView.Aspects.Entity do
  def to_string(a), do: a.entity_id
end
