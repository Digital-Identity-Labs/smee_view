defmodule SmeeView.ViewCommon do

  @moduledoc false

  defmacro __using__(params) do

    params = Keyword.merge(
      [
        roles: false,
        aspect: SmeeView.Aspects.Null,
        one: false,
        map: false,
        features: []
      ],
      params
    )

    quote do

      import SweetXml, except: [sigil_x: 2]
      import Smee.Sigils

      alias Smee.Entity
      alias Smee.Metadata
      alias SmeeView.Utils

      @doc """
      Returns a list of `#{unquote(params[:aspect])}` aspect structs extracted from the input data.

      Input data can be a `Smee.Entity` or `Smee.Metadata` struct, or a list containing `Smee.Entity`, `Smee.Metadata` or
        any aspects. Only appropriate aspect records will be returned.

      `view/3` is useful for extracting specific types of aspects from one Entity, but because it has no entity ID information
        it's often not the best choice for handling Metadata. When extracting information from entire metadata it's often
        better to use `prism/3` which returns the same data in a map, associated with each entity's ID.

       The optional role parameter will optimize the results to only search for either :idp or :sp aspects. The default is :all.

      ```
      #{
        String.split("#{__MODULE__}", ".")
        |> List.last()
      }.view(entity)
      # => [%#{unquote(params[:aspect])}{}, %#{unquote(params[:aspect])}{}]
      ```

      """
      @spec view(list :: Entity.t() | Metadata.t() | list(), role :: atom(), options :: keyword()) :: list()
      def view(list, role \\ :all, options \\ [])
      def view(%Entity{} = entity, role, options) do
        entity
        |> Entity.xdoc()
        |> Utils.extract_data_from_xml(xmapper_for_role(role))
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
      end

      def view(%Metadata{} = metadata, role, options) do
        metadata
        |> Metadata.stream_entities()
        |> Stream.map(fn e -> view(e, role, options) end)
        |> Enum.to_list()
        |> List.flatten()
      end

      def view(things, role, options) when is_list(things) or is_map(things) do
        things
        |> Stream.map(fn x -> if viewable?(x), do: view(x, role, options), else: x end)
        |> Enum.to_list()
        |> List.flatten()
        |> Iteraptor.reduce([], fn {k, v}, acc -> if is?(v), do: [v | acc], else: acc end, yield: :all)
        |> Enum.reject(fn v -> is_nil(v) end)
        |> Enum.uniq()
      end

      @doc """
      Returns a single `#{unquote(params[:aspect])}` aspect struct extracted from one record in the input data.

      Input data can be a `Smee.Entity` or `Smee.Metadata` struct, or a list containing `Smee.Entity`, `Smee.Metadata` or
        any aspects.

      **Only one entity will be processed** and then **only one aspect will be returned**. If you pass one Entity struct as the input, it will be that entity (obviously).
        If you pass metadata structs or lists one entity will be chosen at random. The first suitable entity will be returned.

      `view_one/3` is *intended* for use with a single entity record and aspects like `SmeeView.Aspect.Entity`,
      `SmeeView.Aspect.SP' or `SmeeView.Aspect.Organization' but will work with any aspect.

       The optional role parameter will optimize the results to only search for either :idp or :sp aspects. The default is :all.

      ```
      #{
        String.split("#{__MODULE__}", ".")
        |> List.last()
      }.view_one(entity)
      # => %#{unquote(params[:aspect])}{}
      ```

      """
      @spec view_one(list :: Entity.t() | Metadata.t() | list(), role :: atom(), options :: keyword()) :: unquote(
                                                                                                            params[:aspect]
                                                                                                          ).t() | nil
      def view_one(smee_data, role \\ :all, options \\ [])
      def view_one(%Entity{} = smee_data, role, options) do
        List.wrap(smee_data)
        |> view(role, options)
        |> List.first
      end

      def view_one(%Metadata{} = smee_data, role, options) do
        smee_data
        |> Metadata.stream_entities()
        |> Stream.map(fn e -> view(e, role, options) end)
        |> Stream.reject(fn v -> is_nil(v) || Enum.empty?(v) end)
        |> Stream.take(1)
        |> Enum.to_list()
        |> List.flatten()
        |> List.first
      end

      def view_one(smee_data, role, options) when is_list(smee_data) do
        smee_data
        |> view(role, options)
        |> List.first()
      end

      @doc """
      Returns a map of `#{
        unquote(params[:aspect])
      }` aspect structs extracted from the input data, with entity IDs as keys.

      Input data can be a `Smee.Entity` or `Smee.Metadata` struct, or a list containing `Smee.Entity` and/or `Smee.Metadata` structs.
      Only appropriate aspect records will be returned.

      `prism/3` is useful for extracting specific types of aspects from lists of entity records, or metadata. If you are
        only interested in one aspect from a single `Smee.Entity` struct then you should probably use `view/3` instead.

       The optional role parameter will optimize the results to only search for either :idp or :sp aspects. The default is :all.

      ```
      #{
        String.split("#{__MODULE__}", ".")
        |> List.last()
      }.prism(entity)
      # => %{"https://example.com/shibboleth" =>  [%#{unquote(params[:aspect])}{}, %#{unquote(params[:aspect])}{},]}
      ```

      """
      @spec prism(various :: Entity.t() | Metadata.t() | list(), role :: atom(), options :: keyword()) :: map()
      def prism(various, role \\ :all, options \\ [])
      def prism(various, role, options) when is_list(various) do
        various
        |> Stream.map(fn x -> if prismable?(x), do: prism(x, role, options), else: x end)
        |> Enum.to_list()
        |> List.flatten()
        |> Enum.uniq()
        |> Enum.map(fn m -> Map.to_list(m) end)
        |> Enum.to_list()
        |> List.flatten()
        |> Map.new()
      end

      def prism(%Entity{} = entity, role, options) do
        view = view(entity, role, options)
        id = entity.uri
        %{id => view}
      end

      def prism(%Metadata{} = metadata, role, options) do
        metadata
        |> Metadata.stream_entities()
        |> Stream.map(fn e -> prism(e, role, options) end)
        |> Stream.map(fn m -> Map.to_list(m) end)
        |> Enum.to_list()
        |> List.flatten()
        |> Map.new()
      end

      @doc """
      Removes any non-IdP aspects from a list (view) or map (prism)

      ```
      #{
        String.split("#{__MODULE__}", ".")
        |> List.last()
      }.idp_filter(view)
      # => []
      ```

      """
      @spec idp_filter(aspects :: map() | list()) :: map() | list()
      def idp_filter(prism) when is_map(prism), do: prismify(prism, &idp_filter/1)
      def idp_filter(view) when is_list(view) do
        view
        |> Enum.filter(
             fn aspect ->
               unquote(params[:aspect]).idp?(aspect)
             end
           )
      end

      @doc """
      Removes any non-SP aspects from a list (view) or map (prism)

      ```
      #{
        String.split("#{__MODULE__}", ".")
        |> List.last()
      }.sp_filter(view)
      # => []
      ```

      """
      @spec sp_filter(aspects :: map() | list()) :: map() | list()
      def sp_filter(prism) when is_map(prism), do: prismify(prism, &sp_filter/1)
      def sp_filter(aspects) do
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

            @doc """
            Returns all languages used in the list (view) or map (prism)

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.langs(aspects)
            # => ["en", "se", "zu"]
            ```

            """
            @spec langs(aspects :: map() | list()) :: list()
            def langs(prism) when is_map(prism), do: prismify(prism, &langs/1)
            def langs(aspects) do
              aspects
              |> Enum.map(
                   fn aspect ->
                     unquote(params[:aspect]).lang(aspect)
                   end
                 )
              |> Enum.uniq()
              |> Enum.sort()
            end

            @doc """
            Returns the first aspect with matching language, or failing that, the default language, or English

            This function is useful when showing a UI to users, to select the most appropriate aspect for display

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.pick(aspects, "no")
            # => %#{unquote(params[:aspect])}{lang: "no" text: "..." }
            ```

            """
            @spec pick(aspects :: map() | list()) :: struct()
            def pick(aspects, lang \\ Utils.default_lang())
            def pick(prism, lang) when is_map(prism), do: prismify(prism, lang, &pick/2)
            def pick(aspects, lang) do
              select_by_lang(aspects, lang) || select_by_lang(aspects, Utils.default_lang()) || select_by_lang(
                aspects,
                Utils.default_lang()
              ) || List.first(aspects)
            end

            @spec select_by_lang(aspects :: list(), lang :: binary()) :: struct() | nil
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

            @doc """
            Returns maximum width of text in the view, as an integer

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.max_size(aspects)
            # => 42
            ```

            """
            @spec max_size(aspects :: list() | map()) :: integer()
            def max_size(prism) when is_map(prism), do: prismify(prism, &max_size/1)
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

            @doc """
            Returns true if the aspects contain the specified attribute name

            ```
              #{
                String.split("#{__MODULE__}", ".")
                |> List.last()
              }.contain?(attrs, "urn:oid:1.3.6.1.4.1.5923.1.1.1.6")
            # => true


            ```

            """
            @spec contain?(aspects :: list() | map(), name :: binary()) :: boolean() | map()
            def contain?(aspects, name) when is_map(aspects), do: prismify(aspects, name, &contain?/2)
            def contain?(aspects, name) do
              aspects
              |> Enum.any?(fn a -> a.name == name end)
            end

            @doc """
            Returns true if the aspects contain the specified attribute friendly name

            ```
              #{
                String.split("#{__MODULE__}", ".")
                |> List.last()
              }.contain?(attrs, "sn")
            # => true


            ```

            """
            @spec contain_friendly?(aspects :: list() | map(), name :: binary()) :: boolean() | map()
            def contain_friendly?(aspects, friendly_name) when is_map(aspects),
                do: prismify(aspects, friendly_name, &contain_friendly?/2)
            def contain_friendly?(aspects, friendly_name) do
              aspects
              |> Enum.any?(fn a -> a.friendly_name == friendly_name end)
            end

            @doc """
            Returns a list of all attribute names (full, technical, URI names).

            The results are sorted and each value is unique.

            ```
              #{
                String.split("#{__MODULE__}", ".")
                |> List.last()
              }.names(attrs)
            # => ["urn:oid:1.3.6.1.4.1.5923.1.1.1.6", "urn:oid:0.9.2342.19200300.100.1.3", "urn:oid:2.5.4.10"]
            ```

            """
            @spec names(aspects :: list() | map()) :: list() | map()
            def names(aspects) when is_map(aspects), do: prismify(aspects, &names/1)
            def names(aspects) do
              aspects
              |> Enum.map(
                   fn aspect ->
                     aspect.name
                   end
                 )
              |> List.flatten()
              |> Enum.uniq()
              |> Enum.sort()
            end

            @doc """
            Returns a list of all attribute names (full, technical, URI names).

            The results are sorted and each value is unique.

            ```
              #{
                String.split("#{__MODULE__}", ".")
                |> List.last()
              }.friendly_names(attrs)
            # => ["eduPersonPrincipalName", "email", "organizationName"]
            ```

            """
            @spec friendly_names(aspects :: list() | map()) :: list() | map()
            def friendly_names(aspects) when is_map(aspects), do: prismify(aspects, &friendly_names/1)
            def friendly_names(aspects) do
              aspects
              |> Enum.map(
                   fn aspect ->
                     aspect.friendly_name
                   end
                 )
              |> List.flatten()
              |> Enum.uniq()
              |> Enum.sort()
            end

            ####

            @doc """
            Returns only SAML1 attributes

            Filters the view (list) or prism (map) to only include SAML1 attributes

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.saml1_filter(aspects)
            # =>  [%#{unquote(params[:aspect])}{}]
            ```

            """
            @spec saml1_filter(aspects :: list() | map()) :: list()
            def saml1_filter(prism) when is_map(prism), do: prismify(prism, &saml1_filter/1)
            def saml1_filter(aspects) do
              aspects
              |> Enum.filter(
                   fn aspect ->
                     unquote(params[:aspect]).saml1?(aspect)
                   end
                 )
            end

            @doc "Returns only SAML2 attributes"
            @doc """
            Returns only SAML2 attributes

            Filters the view (list) or prism (map) to only include SAML2 attributes

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.saml2_filter(aspects)
            # => [%#{unquote(params[:aspect])}{}]
            ```

            """
            @spec saml2_filter(aspects :: list() | map()) :: list()
            def saml2_filter(prism) when is_map(prism), do: prismify(prism, &saml2_filter/1)
            def saml2_filter(aspects) do
              aspects
              |> Enum.filter(
                   fn aspect ->
                     unquote(params[:aspect]).saml2?(aspect)
                   end
                 )
            end

            defoverridable [saml1_filter: 1, saml2_filter: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :url) do
          quote do

            @doc """
            Returns filtered list of only valid URLs from a view (list) or prism (map)

            It's unlikely that invalid URLs will be in NREN metadata, but this may be useful when producing your own.

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.valid_filter(aspects)
            # => [%#{unquote(params[:aspect])}{}]
            ```

            """
            @spec valid_filter(aspects :: list() | map()) :: list()
            def valid_filter(prism) when is_map(prism), do: prismify(prism, &valid_filter/1)
            def valid_filter(aspects) do
              aspects
              |> Enum.filter(
                   fn aspect ->
                     unquote(params[:aspect]).valid?(aspect)
                   end
                 )
            end

            defoverridable [valid_filter: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :algo) do
          quote do

            @doc """
            Shortens algorithms

            Removes the URI namespacing prefix from algorithms, making them smaller, friendlier, and potentially conflicting.

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.truncate(aspects)
            # => ["ecdsa-sha1"]
            ```

            """
            @spec truncate(aspects :: list() | map()) :: list()
            def truncate(prism) when is_map(prism), do: prismify(prism, &truncate/1)
            def truncate(aspects) do
              aspects
              |> Enum.map(
                   fn aspect ->
                     unquote(params[:aspect]).truncate(aspect)
                   end
                 )
              |> Enum.uniq()
              |> Enum.sort()
            end

            defoverridable [truncate: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :endpoint) do
          quote do

            @doc """
            Returns all bindings present in the view

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.bindings(aspects)
            # => []
            ```

            """
            @spec bindings(aspects :: list() | map()) :: list()
            def bindings(prism) when is_map(prism), do: prismify(prism, &bindings/1)
            def bindings(aspects) do
              aspects
              |> Enum.map(
                   fn aspect ->
                     unquote(params[:aspect]).binding(aspect)
                   end
                 )
              |> Enum.uniq()
              |> Enum.sort()
            end

            @doc """
            Returns all services matching the specified binding

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.binding_filter(aspect)
            # => []
            ```

            """
            @spec binding_filter(aspects :: list() | map(), binding :: binary()) :: list()
            def binding_filter(prism, binding) when is_map(prism), do: prismify(prism, binding, &binding_filter/2)
            def binding_filter(aspects, binding) do
              aspects
              |> Enum.filter(
                   fn aspect ->
                     unquote(params[:aspect]).binding(aspect) == binding
                   end
                 )
            end

            @doc """
            Sorts the services - only really has an impact if services have an index value set

            ```
            #{
              String.split("#{__MODULE__}", ".")
              |> List.last()
            }.sort(aspect)
            # => [...]
            ```

            """
            @spec sort(aspects :: list() | map()) :: list()
            def sort(prism) when is_map(prism), do: prismify(prism, &sort/1)
            def sort(aspects) do
              aspects
              |> Enum.sort_by(&(&1.index), :asc)
            end

            defoverridable [bindings: 1, binding_filter: 2, sort: 1]

          end

        end

      end

      #######################################################################################

      @spec is?(thing :: any()) :: boolean()
      defp is?(thing) when is_struct(thing) do
        thing.__struct__ == unquote(params[:aspect])
      end

      defp is?(thing) do
        false
      end

      @spec viewable?(thing :: any()) :: boolean()
      defp viewable?(%Entity{}) do
        true
      end

      defp viewable?(%Metadata{}) do
        true
      end

      #      defp viewable?(%SmeeView.Aspects.Entity{}) do
      #        true
      #      end

      defp viewable?(_) do
        false
      end

      @spec prismable?(data :: any()) :: boolean()
      defp prismable?(%Entity{}) do
        true
      end

      defp prismable?(%Metadata{}) do
        true
      end

      #      defp prismable?(%SmeeView.Aspects.Entity{}) do
      #        true
      #      end

      defp prismable?(_) do
        false
      end

      @spec prismify(prism :: map(), f :: function()) :: map()
      defp prismify(prism, f)  do
        prism
        |> Enum.map(fn {e, aspects} -> {e, f.(aspects)} end)
        |> Enum.reject(fn {k, v} -> is_nil(v) || (is_list(v) && Enum.empty?(v)) end)
        |> Map.new()
      end

      @spec prismify(prism :: map(), p1 :: any(), f :: function()) :: map()
      defp prismify(prism, p1, f) do
        prism
        |> Enum.map(fn {e, aspects} -> {e, f.(aspects, p1)} end)
        |> Enum.reject(fn {k, v} -> is_nil(v) || (is_list(v) && Enum.empty?(v)) end)
        |> Map.new()
      end

      @spec prismify(prism :: map(), p1 :: any(), p2 :: any(), f :: function()) :: map()
      defp prismify(prism, p1, p2, f) do
        prism
        |> Enum.map(fn {e, aspects} -> {e, f.(aspects, p1, p2)} end)
        |> Enum.reject(fn {k, v} -> is_nil(v) || (is_list(v) && Enum.empty?(v)) end)
        |> Map.new()
      end

      @spec cascade_views(entity :: Entity.t(), data :: map() | keyword(), role :: atom()) :: map() | keyword()
      defp cascade_views(_entity, data, _role) do
        data
      end

      @spec trim_aspect_data(data :: map() | keyword()) :: map()
      defp trim_aspect_data(data) do
        data
        |> Enum.reject(fn {k, v} -> (v == "") end)
        |> Enum.reject(fn {k, v} -> (is_nil(v)) end)
        |> Map.new()
      end

      @spec to_aspect(data :: map(), role :: atom()) :: map()
      defp to_aspect(data, role) do
        unquote(params[:aspect]).new(Map.merge(data, %{role: role}))
      end

      unquote do

        if params[:roles] do
          quote do
            @spec xmapper_for_role(role :: atom()) :: keyword()
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
            @spec xmapper_for_role(role :: atom()) :: keyword()
            defp xmapper_for_role(_role) do
              [all: entity_xmap()]
            end
          end
        end

      end

      @spec services(entity :: Smee.Entity.t() | list(), role :: atom(), options :: Keyword.t()) :: list()
      defp services(entity, role, options \\ []) do
        [
          SmeeView.ArtifactResolutionServices.view(entity, role, options),
          SmeeView.AssertionConsumerServices.view(entity, role, options),
          SmeeView.AssertionIDRequestServices.view(entity, role, options),
          SmeeView.AttributeConsumingServices.view(entity, role, options),
          SmeeView.AttributeServices.view(entity, role, options),
          SmeeView.ManageNameidServices.view(entity, role, options),
          SmeeView.NameidMappingServices.view(entity, role, options),
          SmeeView.SingleLogoutServices.view(entity, role, options),
          SmeeView.SingleSignonServices.view(entity, role, options)
        ]
        |> List.flatten()
      end

      @spec idp_xmap() :: keyword()
      defp idp_xmap do
        raise "Undefined idp_xmap()! in #{__MODULE__}"
      end

      @spec sp_xmap() :: keyword()
      defp sp_xmap do
        raise "Undefined sp_xmap()! in #{__MODULE__}"
      end

      @spec entity_xmap() :: keyword()
      defp entity_xmap do
        raise "Undefined entity_xmap()! in #{__MODULE__}"
      end

      defoverridable [
        view: 3,
        to_aspect: 2,
        idp_xmap: 0,
        sp_xmap: 0,
        entity_xmap: 0,
        cascade_views: 3,
        idp_filter: 1,
        sp_filter: 1
      ]

    end
  end

  #######################################################################################

end
