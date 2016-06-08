ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PhoenixXml.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PhoenixXml.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PhoenixXml.Repo)

