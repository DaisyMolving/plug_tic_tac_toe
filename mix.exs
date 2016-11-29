defmodule Plug_TTT.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_TTT,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      applications: [:logger, :cowboy, :plug],
      mod: {PlugTicTacToe, []}
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.0"},
      {:cowboy, "~> 1.0"}
    ]
  end
end
