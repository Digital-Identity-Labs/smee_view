defmodule SmeeView.PublicationPath do

  use SmeeView.ViewCommon, aspect: SmeeView.Aspects.Publication, roles: false

  @entity_xmap [
    ~x"//md:Extensions/mdrpi:PublicationPath/mdrpi:Publication"le,
    publisher: ~x"string(@publisher)"s,
    publication_id: ~x"string(@publicationId)"s,

  ]

  defp entity_xmap do
    @entity_xmap
  end


end
