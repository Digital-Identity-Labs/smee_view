defmodule SmeeView.MixProject do
  use Mix.Project

  def project do
    [
      app: :smee_view,
      version: "0.1.0",
      elixir: "~> 1.14",
      description: "Metadata parsing extension for Smee",
      package: package(),
      name: "SmeeView",
      source_url: "https://github.com/Digital-Identity-Labs/smee_view",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [
        tool: ExCoveralls
      ],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      docs: [
        main: "readme",
        # logo: "path/to/logo.png",
        extras: ["README.md", "LICENSE"],
        groups_for_modules: [
          "Views / Collections": view_modules(),
          "Aspects / Items": aspect_modules(),
          "Protocols & Behaviours": protocol_modules()
        ]
      ],
      deps: deps(),
      compilers: Mix.compilers(),
      elixirc_paths: elixirc_paths(Mix.env)
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

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/Digital-Identity-Labs/smee"
      }
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "priv"]
  defp elixirc_paths(_), do: ["lib", "priv"]

  defp protocol_modules do
    [SmeeView.Protocols.Aspect, SmeeView.Behaviours.Aspect, SmeeView.Behaviours.View]
  end

  defp view_modules do
    [
      SmeeView.ArtifactResolutionServices,
      SmeeView.AspectFilter,
      SmeeView.AssertionConsumerServices,
      SmeeView.AssertionIDRequestServices,
      SmeeView.AttributeConsumingServices,
      SmeeView.AttributeServices,
      SmeeView.Attributes,
      SmeeView.Contacts,
      SmeeView.Descriptions,
      SmeeView.DiscoHints,
      SmeeView.DiscoUI,
      SmeeView.DiscoveryResponses,
      SmeeView.Displaynames,
      SmeeView.Domains,
      SmeeView.Entity,
      SmeeView.EntityAttributes,
      SmeeView.EntityFilter,
      SmeeView.Geolocations,
      SmeeView.IdP,
      SmeeView.Keys,
      SmeeView.Keywords,
      SmeeView.Logos,
      SmeeView.ManageNameidServices,
      SmeeView.NameIDFormats,
      SmeeView.NameidMappingServices,
      SmeeView.Networks,
      SmeeView.Organization,
      SmeeView.OrganizationDisplaynames,
      SmeeView.OrganizationNames,
      SmeeView.OrganizationURLs,
      SmeeView.PublicationPath,
      SmeeView.Protocols,
      SmeeView.Registration,
      SmeeView.RegistrationPolicies,
      SmeeView.RequestInitiators,
      SmeeView.RequestedAttributes,
      SmeeView.Roles,
      SmeeView.SP,
      SmeeView.Scopes,
      SmeeView.ServiceDescriptions,
      SmeeView.ServiceNames,
      SmeeView.Services,
      SmeeView.SingleLogoutServices,
      SmeeView.SingleSignonServices
    ]
  end

  defp aspect_modules do
    [
      SmeeView.Aspects.ArtifactResolutionService,
      SmeeView.Aspects.AspectCommon,
      SmeeView.Aspects.AspectTools.Text,
      SmeeView.Aspects.AssertionConsumerService,
      SmeeView.Aspects.AssertionIDRequestService,
      SmeeView.Aspects.Attribute,
      SmeeView.Aspects.AttributeConsumingService,
      SmeeView.Aspects.AttributeService,
      SmeeView.Aspects.Contact,
      SmeeView.Aspects.Description,
      SmeeView.Aspects.DigestMethod,
      SmeeView.Aspects.DiscoveryResponse,
      SmeeView.Aspects.Displayname,
      SmeeView.Aspects.Domain,
      SmeeView.Aspects.EncryptionMethod,
      SmeeView.Aspects.Entity,
      SmeeView.Aspects.EntityAttribute,
      SmeeView.Aspects.Geolocation,
      SmeeView.Aspects.IdP,
      SmeeView.Aspects.InformationURL,
      SmeeView.Aspects.Key,
      SmeeView.Aspects.Keywords,
      SmeeView.Aspects.Logo,
      SmeeView.Aspects.ManageNameidService,
      SmeeView.Aspects.NameIDFormat,
      SmeeView.Aspects.NameidMappingService,
      SmeeView.Aspects.Network,
      SmeeView.Aspects.Organization,
      SmeeView.Aspects.OrganizationDisplayname,
      SmeeView.Aspects.OrganizationName,
      SmeeView.Aspects.OrganizationURL,
      SmeeView.Aspects.PrivacyURL,
      SmeeView.Aspects.Protocol,
      SmeeView.Aspects.Publication,
      SmeeView.Aspects.Registration,
      SmeeView.Aspects.RegistrationPolicy,
      SmeeView.Aspects.RequestInitiator,
      SmeeView.Aspects.RequestedAttribute,
      SmeeView.Aspects.SP,
      SmeeView.Aspects.Scope,
      SmeeView.Aspects.ServiceDescription,
      SmeeView.Aspects.ServiceName,
      SmeeView.Aspects.SigningMethod,
      SmeeView.Aspects.SingleLogoutService,
      SmeeView.Aspects.SingleSignonService
    ]
  end

end
