defmodule SmeeView.MixProject do
  use Mix.Project

  def project do
    [
      app: :smee_view,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: Mix.compilers() ++ [:rambo], # Needed until issue fixed in Rambo
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:smee, "~> 0.2.0"},
      #{:smee, path: "/Users/pete/Projects/smee"},
      {:sweet_xml, "~> 0.7.3"},
      {:briefly, "~> 0.4.0"},
      {:easy_ssl, "~> 1.3"},
      {:xmerl_xml_indent, "~> 0.1.0"},
      {:xmlixer, "~> 0.1.1"},

      {:apex, "~> 1.2", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.6.7", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.14 and >= 0.14.4", only: [:dev, :test]},
      {:benchee, "~> 1.0.1", only: [:dev, :test]},
      {:ex_doc, "~> 0.23.0", only: :dev, runtime: false},
      {:earmark, "~> 1.3", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev], runtime: false},
      {:doctor, "~> 0.17.0", only: :dev, runtime: false}
    ]
  end
end
