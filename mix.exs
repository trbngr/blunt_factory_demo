defmodule FactoryDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :factory_demo,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:commanded, "~> 1.3"},

      # TEST
      {:blunt_data,
       github: "blunt-elixir/blunt", ref: "reorg", sparse: "apps/blunt_data", override: true},
      {:ex_machina, "~> 2.7", only: :test},
      {:faker, "~> 0.17", only: :test}
    ]
  end
end
