defmodule SmeeView.Keys do

  import SmeeView.XML
  import SweetXml, except: [sigil_x: 2, parse: 1]

  alias SmeeView.Aspects.Key
  alias Smee.Entity

  @idp_xmap [
    ~x"//md:IDPSSODescriptor/md:KeyDescriptor"el,
    pem: ~x"string(//ds:X509Certificate)"s,
    names: ~x"string(//ds:KeyName)"ls,
    use: ~x"string(/*/@use)"s,
    subject: ~x"//ds:KeyInfo/ds:X509Data/ds:X509SubjectName"S,
    algorithms: ~x"//md:EncryptionMethod/@algorithm"Sl
  ]

  @sp_xmap [
    ~x"//md:SPSSODescriptor/md:KeyDescriptor"el,
    pem: ~x"string(//ds:X509Certificate)"s,
    names: ~x"string(//ds:KeyName)"ls,
    use: ~x"string(/*/@use)"s,
    subject: ~x"//ds:KeyInfo/ds:X509Data/ds:X509SubjectName"S,
    algorithms: ~x"//md:EncryptionMethod/@algorithm"Sl
  ]

  def view(entity, role \\ :all, options \\ []) do
    entity
    |> Entity.xdoc()
    |> SweetXml.xmap(mapper_for_role(role))
    |> Enum.map(
         fn {role, logos} ->
           Enum.map(logos, fn data -> Key.new(Map.merge(data, %{role: role})) end)
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
