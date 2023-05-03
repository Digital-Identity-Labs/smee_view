defmodule SmeeView.Aspects.AspectCommon do

  @moduledoc false

  alias __MODULE__
  alias SmeeView.Utils

  defmacro __using__(params) do

    params = Keyword.merge(
      [
        composite: false,
        features: [],
      ],
      params
    )

    quote do

      def new(data, options \\ []) do
        struct(%__MODULE__{}, prepare_data(data, options))
      end

      def composite?() do
        unquote(params[:composite])
      end

      unquote do

        if Enum.member?(params[:features], :lang) do
          quote do
            @doc "Lang is here"
            def lang(aspect) do
              case aspect.lang do
                nil -> SmeeView.Utils.default_lang()
                "" -> SmeeView.Utils.default_lang()
                otherwise -> otherwise
              end
            end

            @doc "Lang? is here"
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
            def text(aspect) do
              aspect.text || SmeeView.Utils.default_text()
            end

            defoverridable [text: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :url) do
          quote do
                        def url(aspect) do
                          aspect.url
                        end

                        def valid?(aspect) do
                          case URI.new(aspect.uri) do
                            {:ok, _} -> true
                            {:error, _} -> false
                          end
                        end

            defoverridable [url: 1, valid?: 1]

          end

        end

      end

      unquote do

        if Enum.member?(params[:features], :endpoint) do
          quote do
            def url(aspect) do
              aspect.location
            end

            def valid?(aspect) do
              case URI.new(aspect.location) do
                {:ok, _} -> true
                {:error, _} -> false
              end
            end

            defoverridable [url: 1, valid?: 1]

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
