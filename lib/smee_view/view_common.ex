defmodule SmeeView.ViewCommon do

  defmacro __using__(params) do

    params = Keyword.merge([roles: false, aspect: SmeeView.Aspects.Contact, one: false], params)

    quote do

      import SmeeView.XML
      import SweetXml, except: [sigil_x: 2, parse: 1]

      alias Smee.Entity

      def view(entity, role \\ :all, options \\ []) do

        single = unquote(params[:one])

        list = entity
               |> Entity.xdoc()
               |> SweetXml.xmap(xmapper_for_role(role))
               |> Enum.map(
                    fn {role, logos} ->
                      Enum.map(
                        logos,
                        fn data ->
                          cascade_views(entity, data, role)
                          |> to_aspect(role)
                        end
                      )
                    end
                  )
               |> List.flatten()

        if single, do: List.first(list), else: list

      end

      #######################################################################################

      defp cascade_views(entity, data, role) do
        data
      end

      defp to_aspect(data, role) do
        unquote(params[:aspect]).new(Map.merge(data, %{role: role}))
      end

      unquote do

        if params[:roles] do
          quote do
            defp xmapper_for_role(role) do
              case role do
                :sp -> [sp: sp_xmap]
                :idp -> [idp: idp_xmap]
                :all -> [idp: idp_xmap, sp: sp_xmap]
                _ -> raise "Unknown role!"
              end
            end
          end
        else
          quote do
            defp xmapper_for_role(_role) do
              [all: entity_xmap]
            end
          end
        end

      end

      defp idp_xmap do
        raise "Undefined idp_xmap()! in #{__MODULE__}"
      end

      defp sp_xmap do
        raise "Undefined sp_xmap()! in #{__MODULE__}"
      end

      defp entity_xmap do
        raise "Undefined entity_xmap()! in #{__MODULE__}"
      end

      defoverridable [view: 3, to_aspect: 2, idp_xmap: 0, sp_xmap: 0, entity_xmap: 0, cascade_views: 3]

    end
  end

  #######################################################################################



end
