defmodule SmeeView.View do

  defmacro __using__(params) do

    params = Keyword.merge([roles: false, aspect: SmeeView.Aspects.Contact], params)

    quote do

      import SmeeView.XML
      import SweetXml, except: [sigil_x: 2, parse: 1]

      alias Smee.Entity

      def view(entity, role \\ :all, options \\ []) do
        entity
        |> Entity.xdoc()
        |> SweetXml.xmap(xmapper_for_role(role))
        |> Enum.map(
             fn {role, logos} ->
               Enum.map(logos, fn data -> to_aspect(data, role) end)
             end
           )
        |> List.flatten()
      end

      #######################################################################################

      defp to_aspect(data, role) do
        unquote(params[:aspect]).new(Map.merge(data, %{role: role}))
      end

      defp xmapper_for_role(role) do
        case role do
          :sp -> [sp: sp_xmap]
          :idp -> [idp: idp_xmap]
          :all -> [idp: idp_xmap, sp: sp_xmap]
          _ -> raise "Unknown role!"
        end
      end

      defp idp_xmap do
        nil
      end

      defp sp_xmap do
        nil
      end

      defp entity_xmap do
        nil
      end

      defoverridable [view: 3, to_aspect: 2, idp_xmap: 0, sp_xmap: 0, entity_xmap: 0]

    end
  end

  #######################################################################################



end
