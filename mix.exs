defmodule Ankikorean.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ankikorean,
      version: "0.0.3",
      elixir: "~> 1.7.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Ankikorean.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:tesla, "~> 1.2.1"},
      {:floki, "~> 0.20.0"},
      {:plug_cowboy, "~> 2.0"},
      {:plug, "~> 1.7"},
      {:poison, "~> 3.1"},
      {:mox, "~> 0.4", only: :test},
      {:csv, "~> 2.0.0"},
      {:dialyxir, "~> 1.0.0-rc.4", only: [:dev], runtime: false},
      {:quantum, "~> 2.3"},
      {:timex, "~> 3.0"},
      {:distillery, "~> 2.0"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:assert_value, ">= 0.0.0", only: [:dev, :test]}
    ]
  end
end
