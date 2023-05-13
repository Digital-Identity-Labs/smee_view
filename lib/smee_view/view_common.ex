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
      alias SmeeView.Utils

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

        unquote do

          if params[:one] do
            quote do
              List.first(list)
            end
          else
            quote do
              list
            end
          end
        end

      end

      def view(structure, role, options) when is_struct(structure) do
        structure
        |> dissolve_struct()
        |> Enum.filter(fn aspect -> is_struct(aspect) end)
        |> Enum.filter(fn aspect -> if aspect.__struct__ == unquote(params[:aspect]), do: true, else: false end)
      end

      @doc "Returns only aspects suitable for IdP role (whether or not it exists)"
      def idp(aspects) do
        aspects
        |> Enum.filter(
             fn aspect ->
               unquote(params[:aspect]).idp?(aspect)
             end
           )
      end

      @doc "Returns only aspects suitable for IdP role (whether or not it exists)"
      def sp(aspects) do
        aspects
        |> Enum.filter(
             fn aspect ->
               unquote(params[:aspect]).sp?(aspect)
             end
           )
      end

      unquote do

        if Enum.member?(params[:features], :lang) do
          quote do

            @doc "Returns a list of all languages used in the view"
            def langs(aspects) do
              aspects
              |> Enum.map(
                   fn aspect ->
                     unquote(params[:aspect]).lang(aspect)
                   end
                 )
            end

            @doc "Returns the first aspect with matching language, or failing that, the default language, or English"
            def pick(aspects, lang \\ Utils.default_lang()) do
              select_by_lang(aspects, lang) || select_by_lang(aspects, Utils.default_lang()) || select_by_lang(
                aspects,
                Utils.default_lang()
              ) || List.first(aspects)
            end

            defp select_by_lang(aspects, lang) do
              aspects
              |> Enum.find(
                   nil,
                   fn aspect ->
                     unquote(params[:aspect]).lang(aspect) == String.downcase("#{lang}")
                   end
                 )
            end

            defoverridable [langs: 1, pick: 2]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :text) do
          quote do

            @doc "Returns maximum width of text in the view, as an integer"
            def max_size(aspects) do
              aspects
              |> Enum.max_by(fn a -> String.length(a.text) end, &>=/2, fn -> struct(%SmeeView.Aspects.Null{}) end)
              |> Map.get(:text)
              |> String.length()
            end

            defoverridable [max_size: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :attr) do
          quote do

            @doc "Returns only SAML1 attributes"
            def saml1(aspects) do
              aspects
              |> Enum.filter(
                   fn aspect ->
                     unquote(params[:aspect]).saml1?(aspect)
                   end
                 )
            end

            @doc "Returns only SAML2 attributes"
            def saml2(aspects) do
              aspects
              |> Enum.filter(
                   fn aspect ->
                     unquote(params[:aspect]).saml2?(aspect)
                   end
                 )
            end

            defoverridable [saml1: 1, saml2: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :url) do
          quote do

            @doc "Returns filtered list of only valid URLs"
            def valid(aspects) do
              aspects
              |> Enum.filter(
                   fn aspect ->
                     unquote(params[:aspect]).valid?(aspect)
                   end
                 )
            end

            defoverridable [valid: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :algo) do
          quote do

            @doc "Returns filtered list of only valid URLs"
            def truncate(aspects) do
              aspects
              |> Enum.map(
                   fn aspect ->
                     unquote(params[:aspect]).truncate(aspect)
                   end
                 )
            end

            defoverridable [truncate: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :endpoint) do
          quote do

            @doc "Returns all bindings present in the view"
            def bindings(aspects) do
              aspects
              |> Enum.map(
                   fn aspect ->
                     unquote(params[:aspect]).binding(aspect)
                   end
                 )
            end

            @doc "Returns all services matching the specified binding"
            def binding(aspects, binding) do
              aspects
              |> Enum.filter(
                   fn aspect ->
                     unquote(params[:aspect]).binding(aspect) == binding
                   end
                 )
            end

            @doc "Sorts the services - only really has an impact if services have an index value set"
            def sort(aspects) do
              aspects
              |> Enum.sort_by(&(&1.index), :asc)
            end

            defoverridable [bindings: 1, binding: 2, sort: 1]

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
        |> Enum.reject(fn {k, v} -> (v == "") end)
        |> Enum.reject(fn {k, v} -> (is_nil(v)) end)
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
