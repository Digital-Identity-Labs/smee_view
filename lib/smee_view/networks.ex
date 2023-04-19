defmodule SmeeView.Networks do
#
#  import SmeeView.XML
#  import SweetXml, except: [sigil_x: 2, parse: 1]
#
#  alias SmeeView.Aspects.Logo
#
#  @idp_xmap [
#    ~x"//md:IDPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:Logo"el,
#    url: ~x"./text()"s,
#    height: ~x"string(/*/@height)"i,
#    width: ~x"string(/*/@width)"i,
#    lang: ~x"@xml:lang"s
#  ]
#
#  @sp_xmap [
#    ~x"//md:SPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:Logo"el,
#    url: ~x"./text()"s,
#    height: ~x"string(/*/@height)"i,
#    width: ~x"string(/*/@width)"i,
#    lang: ~x"@xml:lang"s
#  ]
#
#  def view(entity, role \\ :all, options \\ [])
#  def view(entity, :idp, options) do
#    entity
#    |> Entity.xdoc()
#    |> SweetXml.xmap([idp: @idp_xmap])
#    |> Map.values()
#    |> List.flatten()
#    |> Enum.map(fn data -> Logo.new(%{data | role: :idp}) end)
#  end
#
#  def view(entity, :sp, options) do
#    entity
#    |> Entity.xdoc()
#    |> SweetXml.xmap([sp: @sp_xmap])
#    |> Map.values()
#    |> List.flatten()
#    |> Enum.map(fn data -> Logo.new(%{data | role: :sp}) end)
#  end
#
#  def view(entity, :all, options) do
#    entity
#    |> Entity.xdoc()
#    |> SweetXml.xmap([idp: @idp_xmap, sp: @sp_xmap])
#    |> Enum.map(
#         fn {role, logos} ->
#           Enum.map(logos, fn data -> Logo.new(Map.merge(data, %{role: role})) end)
#         end
#       )
#    |> List.flatten()
#  end

  #######################################################################################



end
