import Config

config :cadet, environment: :dev

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :cadet, CadetWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# command from your terminal:
#
#     openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout priv/server.key -out priv/server.pem
#
# The `http:` config above can be replaced with:
#
#     https: [port: 4000, keyfile: "priv/server.key", certfile: "priv/server.pem"],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :cadet, CadetWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/cadet_web/views/.*(ex)$},
      ~r{lib/cadet_web/templates/.*(eex)$}
    ]
  ],
  reloadable_compilers: [:gettext, :phoenix, :elixir, :phoenix_swagger]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :cadet, Cadet.Repo,
  username: "postgres",
  password: "root",
  database: "cadet_dev",
  hostname: "localhost",
  pool_size: 10

config :cadet, Cadet.Auth.Guardian,
  issuer: "cadet",
  secret_key: "UiVBXJi9eJhVrcczxfqFoclJKr6m+s22LW/3e7CRzBmDZmHiprIFhJi4q5JQ7psE"

config :git_hooks,
  hooks: [
    pre_push: [
      verbose: true,
      tasks: [
        {:mix_task, :format, ["--check-formatted"]},
        {:mix_task, :credo},
        {:mix_task, :test}
      ]
    ]
  ]

import_config("dev.secrets.exs")
