## Run with `mix run test/benchmarks/list_ids_benchmark.exs`

sp_src = Smee.Source.new("test/support/static/ukamf_test.xml", type: :single)
sp_md = Smee.Fetch.local!(sp_src)
sp_e = Smee.Metadata.entities(sp_md)
       |> List.first()

Benchee.run(
  %{
    "Big SP" => fn -> SmeeView.sp(sp_e) end,

  },
  time: 30,
  memory_time: 10,
  parallel: 1
)
