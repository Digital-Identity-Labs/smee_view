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

      @doc false
      @spec new(data :: map(), options :: keyword()) :: __MODULE__.t()
      def new(data, options \\ []) do
        struct(%__MODULE__{}, prepare_data(data, options))
      end

      @doc false
      @spec composite?() :: boolean()
      def composite?() do
        unquote(params[:composite])
      end

      unquote do

        if params[:roles] do
          quote do

            @doc """
            Returns the associated role for this aspect: :sp, :idp or :all

            The role type is useful when handling a mixed list of aspects that may be specific to certain roles of an
              entity.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.role(aspect)
            # => :idp
            ```

            """
            @spec role(aspect :: __MODULE__.t()) :: atom()
            def role(%{role: nil}) do
              :all
            end

            def role(%{role: :all}) do
              :all
            end

            def role(%{role: role}) when is_binary(role) do
              String.to_atom(role)
            end

            def role(%{role: role})  do
              role
            end

            def role(_) do
              :all
            end

            @doc """
            Is this aspect relevant to the IdP role?

            Will return `true` if the aspect has been derived from an IdP role, or is applicable to all roles.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.idp?(aspect)
            # => true
            ```

            """
            @spec idp?(aspect :: __MODULE__.t()) :: boolean()
            def idp?(%{role: :sp}) do
              false
            end

            def idp?(_) do
              true
            end

            @doc """
            Is this aspect relevant to the SP role?

            Will return `true` if the aspect has been derived from an SP role, or is applicable to all roles.

                    ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.sp?(aspect)
            # => false
            ```
            """
            @spec sp?(aspect :: __MODULE__.t()) :: boolean()
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

            @doc """
            Returns the associated role for this aspect: :sp, :idp or :all

            The role type is useful when handling a mixed list of aspects that may be specific to certain roles of an
              entity.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.role(aspect)
            # => :idp
            ```

            """
            @spec role(aspect :: __MODULE__.t()) :: atom()
            def role(aspect) do
              :all
            end

            @doc """
            Is this aspect relevant to the IdP role?

            Will return `true` if the aspect has been derived from an IdP role, or is applicable to all roles.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.idp?(aspect)
            # => true
            ```

            """
            @spec idp?(aspect :: __MODULE__.t()) :: boolean()
            def idp?(aspect) do
              true
            end

            @doc """
            Is this aspect relevant to the SP role?

            Will return `true` if the aspect has been derived from an SP role, or is applicable to all roles.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.sp?(aspect)
            # => false
            ```
            """
            @spec sp?(aspect :: __MODULE__.t()) :: boolean()
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

            @doc """
            Returns the language of this aspect (as a two letter ISO 639-1 code)

            If no language code has been set for this aspect then the default language code will be returned.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.lang(aspect)
            # => "fr"
            ```
            """
            @spec lang(aspect :: __MODULE__.t()) :: binary()
            def lang(aspect) do
              case aspect.lang do
                nil -> SmeeView.Utils.default_lang()
                "" -> SmeeView.Utils.default_lang()
                otherwise -> otherwise
              end
            end

            @doc """
            Is the aspect using this language? (two letter ISO 639-1 code)

            Returns true if the provided code matches that of the aspect.

            If no language code has been set for this aspect then the aspect will be assumed to have
            the default language code.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.lang?(aspect, "en")
            # => false
            ```
            """
            @spec lang?(aspect :: __MODULE__.t()) :: boolean()
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

            @doc """
            Returns the text for the aspect.

            If you are trying to show the text for a particular language then use a function from the matching View
              instead, and provide a list of aspects for it to choose from.

            Aspects containing text are printable and can be converted to strings using `Kernel.to_string/1` or
              interpolated into another string.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.text(aspect)
            # => "Example University IdP"
            ```

            """
            @spec text(aspect :: __MODULE__.t()) :: binary()
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

            @doc """
            Returns the name/text for this algorithm.

            Aspects containing text are printable and can be converted to strings using `Kernel.to_string/1` or
              interpolated into another string.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.algorithm(aspect)
            # => "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha1"
            ```

            """
            @spec algorithm(aspect :: __MODULE__.t()) :: binary()
            def algorithm(aspect) do
              aspect.algorithm
            end

            @doc """
            Removes the namespace for the algorithm, leaving a smaller, friendlier, potentially colliding name

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.truncate(aspect)
            # => "ecdsa-sha1"
            ```
            """
            @spec truncate(aspect :: __MODULE__.t()) :: binary()
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

            @doc """
            Returns the human-readable name for this attribute

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.friendly_name(aspect)
            # => "eduPersonScopedAffiliation"
            ```
            """
            @spec friendly_name(aspect :: __MODULE__.t()) :: binary()
            def friendly_name(aspect) do
              aspect.friendly_name
            end

            @doc """
            Returns the technical name for this attribute

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.name(aspect)
            # => "urn:oid:1.3.6.1.4.1.5923.1.1.1.9"
            ```
            """
            @spec name(aspect :: __MODULE__.t()) :: binary()
            def name(aspect) do
              aspect.name
            end

            @doc """
            Returns for technical name format for this attribute

            (It'll almost certainly be "urn:oasis:names:tc:SAML:2.0:attrname-format:uri")

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.name_format(aspect)
            # => "urn:oasis:names:tc:SAML:2.0:attrname-format:uri"
            ```
            """
            @spec name_format(aspect :: __MODULE__.t()) :: binary()
            def name_format(aspect) do
              aspect.name_format
            end

            @doc """
            Is this a SAML1 attribute? Returns true if passed a SAML1 attribute.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.saml1?(aspect)
            # => false
            ```
            """
            @spec saml1?(aspect :: __MODULE__.t()) :: boolean()
            def saml1?(aspect) do
              String.starts_with?(aspect.name_format, "urn:mace:shibboleth:1.0")
            end

            @doc """
            Is this a SAML2 attribute? Returns true if a passed SAML2 attribute

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.saml2?(aspect)
            # => true
            ```
            """
            @spec saml2?(aspect :: __MODULE__.t()) :: boolean()
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

            @doc """
            Returns the URL for this aspect, as a text binary

            Aspects containing URLs are printable and can be converted to strings using `Kernel.to_string/1` or
              interpolated into another string.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.url(aspect)
            # => "https://idp.example.com/information"
            ```
            """
            @spec url(aspect :: __MODULE__.t()) :: binary()
            def url(aspect) do
              aspect.url
            end

            @doc """
            Returns the URL for this aspect as a parsed URI struct.

            If the URI cannot be parsed then an exception will be raised. If you need more control you should either
              use `valid?/1` first, or just use `URI.parse/1` yourself.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.parsed!(aspect)
            # => %URI{...}
            ```
            """
            @spec parsed!(aspect :: __MODULE__.t()) :: URI.t()
            def parsed!(aspect) do
              case URI.new(aspect.url) do
                {:ok, uri} -> uri
                {:error, _} -> raise "Unable to parse #{aspect.uri}!"
              end
            end

            @doc """
            Is this a valid URL? Returns true if the URL can be parsed.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.valid?(aspect)
            # => false
            ```
            """
            @spec valid?(aspect :: __MODULE__.t()) :: boolean()
            def valid?(aspect) do
              case URI.new(aspect.url) do
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

            @doc """
            Returns the endpoint URL for this endpoint/service.

            Aspects containing URLs are printable and can be converted to strings using `Kernel.to_string/1` or
              interpolated into another string.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.endpoint(aspect)
            # => "https://test.ukfederation.org.uk/Shibboleth.sso/SAML2/POST"
            ```
            """
            @spec endpoint(aspect :: __MODULE__.t()) :: binary()
            def endpoint(aspect) do
              aspect.location
            end

            @doc """
            Returns the binding type for this endpoint/service

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.binding(aspect)
            # => "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
            ```
            """
            @spec binding(aspect :: __MODULE__.t()) :: binary()
            def binding(aspect) do
              aspect.binding
            end

            @doc """
            Returns the index type for this endpoint/service, as an integer.

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.index(aspect)
            # => 1
            ```
            """
            @spec index(aspect :: __MODULE__.t()) :: integer()
            def index(%{index: index}) when is_binary(index) do
              Integer.parse(index)
            end

            def index(%{index: index}) do
              index
            end

            def index(aspect) do
              0
            end

            @doc """
            Is the URL for this endpoint/service valid? Returns true if the endpoint URL can be parsed

            ```
            #{String.split("#{__MODULE__}", ".") |> List.last()}.valid?(aspect)
            # => true
            ```
            """
            @spec valid?(aspect :: __MODULE__.t()) :: boolean()
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
