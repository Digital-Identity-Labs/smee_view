# SmeeView

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `smee_view` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:smee_view, "~> 0.1.0"}
  ]
end
```

```elixir
#entity
#|> SPDisco.new()
#|> IdPDisco.logos()
#|> Logos.pick_login()
#|> Logos.resize(80, 20)
#
#entity
#|> IdPDisco.new()
#|> IdPDisco.displayName(lang: "de")
#
#OR
#
#entity
#|> SmeeView.idp_logos()
#|> Logos.pick_login()
#|> Logos.resize(80, 20)
#
#entity
#|> SmeeView.IDP.logos()
#|> Logos.pick_login()
#|> Logos.resize(80, 20)



```

Working:
```elixir

Smee.Metadata.stream_entities(md3)
|> Stream.map(fn e -> SmeeView.displaynames(e) end)
|> Enum.to_list() 
|> List.flatten()
|> Enum.each(fn d -> IO.puts d.text end)

```


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/smee_view>.
