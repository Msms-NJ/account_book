defmodule AccountBook.MixProject do
  use Mix.Project

  def project do
    [
      app: :account_book,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {AccountBook.Application, []},
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
      {:phoenix, "~> 1.5.8"},
      {:phoenix_ecto, "~> 4.1"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      # Guardian is a token based authentication library for use with Elixir applications.
      {:guardian, "~> 2.1.1"},
      # Argon2 password hashing algorithm for Elixir
      {:argon2_elixir, "~> 2.4"},
      # Cron-like job scheduler for Elixir.
      {:quantum, "~> 3.3"},
      # Yet Another HTTP client for Elixir powered by hackney
      {:httpoison, "~> 1.8"},
      # Ecto extension to support enums in models
      {:ecto_enum, "~> 1.4"},
      # Powerful in-memory key/value storage for Elixir
      {:cachex, "~> 3.3"},
      # Timex is a rich, comprehensive Date/Time library for Elixir projects,
      # with full timezone support via the :tzdata package.
      # If you need to manipulate dates, times, datetimes, timestamps, etc., then Timex is for you!
      {:timex, "~> 3.6"},
      # The Official Elixir client for Sentry
      {:sentry, "~> 8.0"},
      # Paginate your Ecto queries with Scrivener
      {:scrivener_ecto, "~> 2.4"},
      # Tzdata is a parser and library for the tz database.
      {:tzdata, "~> 1.1"},
      # Credo is a static code analysis tool for the Elixir language with a focus on teaching and code consistency.
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
