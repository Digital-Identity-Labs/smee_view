defmodule SmeeView.ViewCommon do

  @moduledoc false

  defmacro __using__(params) do

    params = Keyword.merge(
      [
        roles: false,
        aspect: SmeeView.Aspects.Null,
        one: false,
        features: []
      ],
      params
    )

    quote do

      import SmeeView.XML
      import SweetXml, except: [sigil_x: 2, parse: 1]

      alias Smee.Entity

      def view(list, role \\ :all, options \\ [])
      def view(list, role, options) when is_list(list) do
        list
        |> Enum.filter(fn st -> is_struct(st) end)
        |> Enum.map(fn st -> if st.__struct__ != unquote(params[:aspect]), do: dissolve_struct(st), else: st end)
        |> Enum.filter(fn aspect -> is_struct(aspect) end)
        |> Enum.filter(fn aspect -> if aspect.__struct__ == unquote(params[:aspect]), do: true, else: false end)
      end

      @doc "Docs for view function - do they appear?"
      def view(%Entity{} = entity, role, options) do

        single = unquote(params[:one])

        list = entity
               |> Entity.xdoc()
               |> extract_data_from_xml(xmapper_for_role(role))
               |> Enum.map(
                    fn {role, aspects} ->
                      Enum.map(
                        aspects,
                        fn aspect_data ->
                          cascade_views(entity, aspect_data, role)
                          |> trim_aspect_data()
                          |> to_aspect(role)
                        end
                      )
                    end
                  )
               |> List.flatten()

        if single, do: List.first(list), else: list

      end

      def view(structure, role, options) when is_struct(structure) do
        structure
        |> dissolve_struct()
        |> Enum.filter(fn aspect -> is_struct(aspect) end)
        |> Enum.filter(fn aspect -> if aspect.__struct__ == unquote(params[:aspect]), do: true, else: false end)
      end

      unquote do

        if Enum.member?(params[:features], :lang) do
          quote do




            #defoverridable [lang: 1, lang?: 2]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :text) do
          quote do



           # defoverridable [text: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :url) do
          quote do




            #defoverridable [url: 1, valid?: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :endpoint) do
          quote do



           # defoverridable [url: 1, valid?: 1]

          end

        end

      end


      #######################################################################################

      defp dissolve_struct(struct) do
        struct
        |> Map.from_struct()
        |> Map.to_list()
        |> Keyword.values()
        |> List.flatten()
      end

      ## Move to Utils?
      defp extract_data_from_xml(xdoc, xmap) do
        if Enum.all?(Keyword.values(xmap), fn v -> is_nil(v) end) do
          [all: []]
        else
          SweetXml.xmap(xdoc, xmap)
        end
      end

      defp cascade_views(entity, data, role) do
        data
      end

      defp trim_aspect_data(data) do
        data
        |> Enum.reject(fn {k, v} -> (v == "" || is_nil(v)) end)
        |> Map.new()
      end

      defp to_aspect(data, role) do
        unquote(params[:aspect]).new(Map.merge(data, %{role: role}))
      end

      unquote do

        if params[:roles] do
          quote do
            defp xmapper_for_role(role) do
              case role do
                :sp -> [sp: sp_xmap()]
                :idp -> [idp: idp_xmap()]
                :all -> [idp: idp_xmap(), sp: sp_xmap()]
                _ -> raise "Unknown role!"
              end
            end
          end
        else
          quote do
            defp xmapper_for_role(_role) do
              [all: entity_xmap()]
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
