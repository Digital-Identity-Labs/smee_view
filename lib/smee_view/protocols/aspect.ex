defprotocol SmeeView.Protocols.Aspect do

  alias SmeeView.Utils

  @doc "idp?"
  def idp?(aspect)

  @doc "sp?"
  def sp?(aspect)

  def lang?(aspect, lang \\ Utils.default_lang())

  def composite?(aspect)

end
