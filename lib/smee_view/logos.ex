defmodule SmeeView.Logos do

  import SmeeView.XML
  import SweetXml, except: [sigil_x: 2, parse: 1]

  alias Smee.Entity
  alias SmeeView.Aspects.Logo

  @idp_xmap [
    ~x"//md:IDPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:Logo"el,
    url: ~x"./text()"s,
    height: ~x"string(/*/@height)"i,
    width: ~x"string(/*/@width)"i,
    lang: ~x"@xml:lang"s
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor/md:Extensions/mdui:UIInfo/mdui:Logo"el,
    url: ~x"./text()"s,
    height: ~x"string(/*/@height)"i,
    width: ~x"string(/*/@width)"i,
    lang: ~x"@xml:lang"s
  ]

  def view(entity, role \\ :all, options \\ []) do
    entity
    |> Entity.xdoc()
    |> SweetXml.xmap(mapper_for_role(role))
    |> Enum.map(
         fn {role, logos} ->
           Enum.map(logos, fn data -> Logo.new(Map.merge(data, %{role: role})) end)
         end
       )
    |> List.flatten()
  end

  #######################################################################################

  defp mapper_for_role(role) do
    case role do
      :sp -> [sp: @sp_xmap]
      :idp -> [idp: @idp_xmap]
      :all -> [idp: @idp_xmap, sp: @sp_xmap]
      _ -> raise "Unknown role!"
    end
  end
  

end
