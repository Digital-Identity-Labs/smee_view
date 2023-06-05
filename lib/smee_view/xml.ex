defmodule SmeeView.XML do
  @moduledoc false

  # Define implementation for user modules to use
  import SweetXml, except: [sigil_x: 2, parse: 1]

  # no spec needed
  def sigil_x(str, opts) do
    for {k, v} <- Smee.XmlCfg.namespaces(), reduce: SweetXml.sigil_x(str, opts) do
      acc ->
      SweetXml.add_namespace(acc, k, v)
    end
  end

  # no spec needed
  def parse(xml) do
    SweetXml.parse(xml, namespace_conformant: true)
  end

  # Defoverridable makes the given functions in the current module overridable
  defoverridable [sigil_x: 2, parse: 1]
end
