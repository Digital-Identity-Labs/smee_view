defmodule SmeeView.Aspects.Scope do

  @moduledoc """
  Represents and processes <shibmd:Scope> elements in entity metadata as Aspect structs.

  The functions in this module are intended to be applied to individual Aspect structs - for extracting and processing
  collections of these records please use the matching View module.
  """


  alias SmeeView.Utils


  @type t :: %__MODULE__{
               regex: boolean(),
               domain: binary()
             }

  @derive Jason.Encoder
  defstruct [
    regex: false,
    domain: nil
  ]

  use SmeeView.Aspects.AspectCommon

  @doc """
  Returns the domain of the scope as a string (whether or not it is a regex)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.scope(aspect)
  # => "example.com"
  ```
  """
  @spec scope(aspect :: __MODULE__.t()) :: binary()
  def scope(aspect) do
    aspect.domain
  end

  @doc """
  Returns the domain of the scope as a string (whether or not it is a regex)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.text(aspect)
  # => "example.com"
  ```
  """
  @spec text(aspect :: __MODULE__.t()) :: binary()
  def text(aspect) do
    aspect.domain
  end

  @doc """
  Returns the domain of the scope as a string (whether or not it is a regex)

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.domain(aspect)
  # => "example.com"
  ```
  """
  @spec domain(aspect :: __MODULE__.t()) :: binary()
  def domain(aspect) do
    aspect.domain
  end

  @doc """
  Does the scope ask to be treated as a regular expression? Returns true if scope is a regex.

  ```
  #{
    String.split("#{__MODULE__}", ".")
    |> List.last()
  }.regex?(aspect)
  # => false
  ```
  """
  @spec regex?(aspect :: __MODULE__.t()) :: boolean()
  def regex?(aspect) do
    aspect.domain
  end

  #######################################################################################

  #@spec is not needed
  defp prepare_data(data) do
    Map.merge(data, %{regex: Utils.parse_boolean(data[:regex])})
  end

end

defimpl String.Chars, for: SmeeView.Aspects.Scope do
@moduledoc false
  def to_string(a), do: a.domain
end
