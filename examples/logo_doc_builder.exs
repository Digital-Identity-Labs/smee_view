## Run with `elixir examples/logo_doc_builder.exs > out.md`
## then `pandoc -f markdown --toc out.md  > out.html`

Mix.install([{:solid, "~> 0.14.1"}, {:smee_view, "~> 0.1.0"}])


template_source = File.read!("./examples/logo_doc_builder.md.liquid")
{:ok, template} = Solid.parse(template_source)

process_logos_fn = fn logos ->
  Enum.map(
    logos,
    fn logo ->
      Map.from_struct(logo)
      |> Enum.map(fn {k, v} -> {to_string(k), to_string(v)} end)
      |> Map.new()
    end
  )
end

logo_data =
  Smee.source("http://metadata.ukfederation.org.uk/ukfederation-metadata.xml")
  |> Smee.fetch!()
  |> SmeeView.Logos.prism()
  |> SmeeView.Logos.sp_filter()
  |> Enum.map(fn {id, logos} -> %{"id" => id, "logos" => process_logos_fn.(logos)} end)

output = Solid.render!(
           template,
           %{"logo_data" => logo_data}
         )
         |> to_string

IO.puts output
