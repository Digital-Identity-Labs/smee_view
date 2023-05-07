defmodule SmeeView.Aspects.AspectCommon do

  @moduledoc false

  alias __MODULE__
  alias SmeeView.Utils

  defmacro __using__(params) do

    params = Keyword.merge(
      [
        composite: false,
        features: [],
        roles: false
      ],
      params
    )

    quote do

      @doc "Returns a new aspect of this type"
      def new(data, options \\ []) do
        struct(%__MODULE__{}, prepare_data(data, options))
      end

      @doc "Does this aspect contain various other types of aspect?"
      def composite?() do
        unquote(params[:composite])
      end

      unquote do

        if params[:roles] do
          quote do

            @doc "Role for this aspect"
            def role(%{role: role}) when is_nil(role) or role == :all do
              :all
            end

            def role(%{role: role}) do
              role
            end

            def role(_) do
              :all
            end

            @doc "Is this aspect relevant to the IdP role?"
            def idp?(%{role: :sp}) do
              false
            end

            def idp?(_) do
              true
            end

            @doc "Is this aspect relevant to the SP role?"
            def sp?(%{role: :idp}) do
              false
            end

            def sp?(_) do
              true
            end

            defoverridable [sp?: 1, idp?: 1]

          end

        else

          quote do

            @doc "Role for this aspect"
            def role(aspect) do
              :all
            end

            @doc "Is this aspect relevant to the IdP role?"
            def idp?(aspect) do
              true
            end

            @doc "Is this aspect relevant to the SP role?"
            def sp?(aspect) do
              true
            end

            defoverridable [sp?: 1, idp?: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :lang) do
          quote do

            @doc "Return the language of this aspect"
            def lang(aspect) do
              case aspect.lang do
                nil -> SmeeView.Utils.default_lang()
                "" -> SmeeView.Utils.default_lang()
                otherwise -> otherwise
              end
            end

            @doc "Is the aspect using this language?"
            def lang?(aspect, lang \\ SmeeView.Utils.default_lang()) do
              aspect.lang == lang
            end

            defoverridable [lang: 1, lang?: 2]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :text) do
          quote do

            @doc "Returns the text for the aspect"
            def text(aspect) do
              aspect.text || SmeeView.Utils.default_text()
            end

            defoverridable [text: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :algo) do
          quote do

            @doc "Returns the name/text for this algorithm"
            def algorithm(aspect) do
              aspect.algorithm
            end

            @doc "Removes the namespace for the algorithm, leaving a smaller, friendlier, potentially colliding name"
            def truncate(aspect) do
               [_, short] = String.split(aspect.algorithm, "#", parts: 2)
               short
            end

            defoverridable [algorithm: 1, truncate: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :attr) do
          quote do

            @doc "Returns the human-readable name for this attribute"
            def friendly_name(aspect) do
              aspect.friendly_name
            end

            @doc "Returns the technical name for this attribute"
            def name(aspect) do
              aspect.name
            end

            @doc "Returns for technical name format for this attribute"
            def name_format(aspect) do
              aspect.name_format
            end

            @doc "Is this a SAML1 attribute?"
            def saml1?(aspect) do
              String.starts_with?(aspect.name_format, "urn:mace:shibboleth:1.0")
            end

            @doc "Is this a SAML2 attribute?"
            def saml2?(aspect) do
              String.starts_with?(aspect.name_format, "urn:oasis:names:tc:SAML:2.0")
            end

            defoverridable [saml1?: 1, saml2?: 1, name_format: 1, friendly_name: 1, name: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :url) do
          quote do

            @doc "Returns the URL for this aspect, as a text binary"
            def url(aspect) do
              aspect.url
            end

            @doc "Returns the URL for this aspect as a parsed URI struct"
            def parsed!(aspect) do
              case URI.new(aspect.uri) do
                {:ok, uri} -> uri
                {:error, _} -> raise "Unable to parse #{aspect.uri}!"
              end
            end

            @doc "Is this a valid URL?"
            def valid?(aspect) do
              case URI.new(aspect.uri) do
                {:ok, _} -> true
                {:error, _} -> false
              end
            end

            defoverridable [url: 1, valid?: 1, parsed!: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :endpoint) do
          quote do

            @doc "Returns the endpoint URL for this endpoint/service"
            def endpoint(aspect) do
              aspect.location
            end

            @doc "Returns the binding type for this endpoint/service"
            def binding(aspect) do
              aspect.binding
            end

            @doc "Returns the index type for this endpoint/service"
            def index(%{index: index}) do
              index
            end

            def index(aspect) do
              nil
            end

            @doc "Is the URL for this endpoint/service valid?"
            def valid?(aspect) do
              case URI.new(aspect.location) do
                {:ok, _} -> true
                {:error, _} -> false
              end
            end

            defoverridable [endpoint: 1, valid?: 1, binding: 1, index: 1]

          end

        end

      end

      #######################################################################################

      defp prepare_data(data, options \\ []) do
        data
      end

      defoverridable [composite?: 0, new: 2, prepare_data: 2]

    end

  end

end
